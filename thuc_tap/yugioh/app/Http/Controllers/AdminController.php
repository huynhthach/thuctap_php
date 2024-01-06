<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\News;
use App\Models\NewsCategory;
use App\Models\NewsDetail;
use App\Models\User; // Fix the namespace
use App\Models\Item;
use App\Models\Views;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class AdminController extends Controller
{
    public function admin_index()
    {
        // Lấy 3 views có số lần xem cao nhất của 'card'
        $cardViews = Views::where('Path', 'like', '/cardinfo/increment-views/%')->orderBy('View', 'desc')->take(3)->get();

        // Lấy 3 views có số lần xem cao nhất của 'news'
        $newsViews = Views::where('Path', 'like', '/news/%')->orderBy('View', 'desc')->take(3)->get();
        
        // Lấy ID của các views tương ứng
        $cardViewIds = $cardViews->pluck('ID');
        $newsViewIds = $newsViews->pluck('ID');

        // Lấy thông tin từ bảng Items và News dựa trên danh sách ID
        $cardItems = Item::whereIn('ItemID', $cardViewIds)->get();
        $newsItems = News::whereIn('NewsID', $newsViewIds)->get();

        // Xử lý dữ liệu để truyền cho view
        $labelsCard = $cardItems->pluck('ItemName');
        $viewsCard = $cardItems->map(function ($item) use ($cardViews) {
            return $cardViews->where('ID', $item->ItemID)->first()->View;
        });

        $labelsNews = $newsItems->pluck('Title');
        $viewsNews = $newsItems->map(function ($item) use ($newsViews) {
            return $newsViews->where('ID', $item->NewsID)->first()->View;
        });

        return view('admin.admin', compact('labelsCard', 'viewsCard', 'labelsNews', 'viewsNews'));
    }
    
    public function database()
    {
        $db = DB::table('news')->select('CategoryName','Title','PublishedDate','NewsID')->join('newscategories','news.CategoryID','=','newscategories.CategoryID');
        $db = $db->get();  
        return view('admin.admin_manage.news_manage',['db' => $db]);
    }
    
    public function editForm($id)
    {
        $news = News::with('category', 'details')->findOrFail($id);
        $categories = NewsCategory::all();
        return view('admin.function.edit', compact('news', 'categories'));
    }

    public function editnews(Request $request, $id)
    {
        // Function to check if the file has a valid image MIME type
        $isValidImage = function ($file) {
            $allowedMimeTypes = ['image/jpeg', 'image/png', 'image/gif'];

            return in_array($file->getClientMimeType(), $allowedMimeTypes);
        };

        // Check if the uploaded news image has a duplicate name and is a valid image
        if ($request->hasFile('news_image')) {
            $image = $request->file('news_image');
            $imageName = $image->getClientOriginalName();

            if (!$isValidImage($image)) {
                return redirect()->back()->with('error', 'Chỉ chấp nhận file ảnh (JPEG, PNG, GIF). Vui lòng chọn một file khác.');
            }

            $duplicateImagesNews = DB::table('News')
                ->where('image', $imageName)
                ->where('NewsID', '!=', $id)
                ->count();

            if ($duplicateImagesNews > 0) {
                return redirect()->back()->with('error', 'Tên ảnh đã tồn tại trong hệ thống. Vui lòng chọn một ảnh khác.');
            }
        }

        // Check if the uploaded news detail image has a duplicate name and is a valid image
        if ($request->hasFile('news_detail_image')) {
            $imageDetail = $request->file('news_detail_image');
            $imageDetailName = $imageDetail->getClientOriginalName();

            if (!$isValidImage($imageDetail)) {
                return redirect()->back()->with('error', 'Chỉ chấp nhận file ảnh (JPEG, PNG, GIF). Vui lòng chọn một file khác.');
            }

            $duplicateImagesNewsDetail = DB::table('NewsDetails')
                ->where('ImagePath', $imageDetailName)
                ->where('NewsID', $id)
                ->count();

            if ($duplicateImagesNewsDetail > 0) {
                return redirect()->back()->with('error', 'Tên ảnh đã tồn tại trong hệ thống. Vui lòng chọn một ảnh khác.');
            }
        }
    
        // Update news
        DB::table('News')
            ->where('NewsID', $id)
            ->update([
                'Title' => $request->input('title'),
                'CategoryID' => $request->input('category_id'),
                'PublishedDate' => now(),
            ]);
    
        // Update news detail
        DB::table('NewsDetails')
            ->join('News', 'News.NewsID', '=', 'NewsDetails.NewsID')
            ->where('NewsDetails.NewsID', $id)
            ->update([
                'Content' => $request->input('content'),
            ]);
    
        // Process and save the image for News
        if ($request->hasFile('news_image')) {
            $image = $request->file('news_image');
            $imageName = $image->getClientOriginalName();
            $image->move(public_path('img/img_news/'), $imageName);
            DB::table('News')
                ->where('NewsID', $id)
                ->update(['image' => $imageName]);
        }
    
        // Process and save the image for NewsDetail
        if ($request->hasFile('news_detail_image')) {
            $imageDetail = $request->file('news_detail_image');
            $imageDetailName = $imageDetail->getClientOriginalName();
            $imageDetail->move(public_path('img/img_news_detail/'), $imageDetailName);
            DB::table('NewsDetails')
                ->where('NewsDetails.NewsID', $id)
                ->update(['ImagePath' => $imageDetailName]);
        }
    
        return redirect()->route('database');
    }        

    public function createForm()
    {
        $categories = NewsCategory::all();
        return view('admin.function.create', compact('categories'));
    }

    public function create(Request $request)
    {
        // Validation rules for file uploads
        $validationRules = [
            'news_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust the file types and size as needed
            'news_detail_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ];
    
        // Validate the request data
        $validator = Validator::make($request->all(), $validationRules);
    
        // If validation fails, redirect back with errors
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
    
        // Create new news
        $news = new News;
        $newsDetail = new NewsDetail;
        $news->Title = $request->input('title');
    
        // Upload image for News
        if ($request->hasFile('news_image')) {
            $image = $request->file('news_image');
            $imageName = $image->getClientOriginalName(); // Use the original name
            $image->move(public_path('img/img_news/'), $imageName);
            $news->image = $imageName;
        }
    
        // Upload image for NewsDetail
        if ($request->hasFile('news_detail_image')) {
            $imageDetail = $request->file('news_detail_image');
            $imageDetailName = $imageDetail->getClientOriginalName(); // Use the original name
            $imageDetail->move(public_path('img/img_news_detail/'), $imageDetailName);
            $newsDetail->ImagePath = $imageDetailName;
        }
    
        $news->CategoryID = $request->input('category_id');
        $news->PublishedDate  = Carbon::now();
        $news->save();
    
        // Create new news detail
        $newsDetail->Content = $request->input('content');
        $newsDetail->NewsID = $news->NewsID;
        $newsDetail->save();
    
        return redirect()->route('database');
    }
    
        
    public function delete($id)
    {
        // Kiểm tra xem news có tồn tại không
        $news = News::find($id);

        if (!$news) {
            return redirect()->route('database')->with('error', 'News not found');
        }

        // Xóa news detail trước
        $news->details()->delete();

        // Xóa news
        $news->delete();

        return redirect()->route('database')->with('success', 'News deleted successfully');
    }

    public function index()
    {
        // Lấy thông tin người dùng hiện tại
        $currentUser = Auth::user();

        // Lấy toàn bộ người dùng trừ người đang đăng nhập
        $users = User::where('UserID', '!=', $currentUser->UserID)->get();

        return view('admin.admin_manage.users', compact('users'));
    }


    public function edituser($id)
    {
        $user = User::find($id);
        return view('admin.function.edit_user', compact('user'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'Username' => 'required',
            'Email' => 'required|email',
            'IDRole' => 'required',
        ]);

        $user = User::find($id);
        $user->update($request->all());

        return redirect()->route('users.index')->with('success', 'User updated successfully');
    }

    public function destroy($id)
    {
        $user = User::find($id);
        $user->delete();

        return redirect()->route('users.index')->with('success', 'User deleted successfully');
    }


    // card manage
    public function index_card()
    {
        $items = Item::all();
        return view('admin.admin_manage.item_manage', compact('items'));
    }

    public function create_card()
    {
        return view('admin.function.create_card');
    }

    public function store_card(Request $request)
    {
        // Create new news
        $item = new Item;
        $item->ItemName = $request->input('ItemName');
        $item->ItemCategory = $request->input('ItemCategory');
        $item->Description  = $request->input('Description');
        // Upload image for News
        if ($request->hasFile('item_image')) {
            $image = $request->file('item_image');
            $imageName = $image->getClientOriginalName(); // Use the original name
            $image->move(public_path('img/item_img/'), $imageName);
            $item->image = $imageName;
        }

        $item->save();

        return redirect()->route('cards.index');
    }

    public function edit_card($id)
    {
        $item = Item::findOrFail($id);
        return view('admin.function.edit_card', compact('item'));
    }

    public function update_card(Request $request, $id)
    {
        $item = Item::findOrFail($id);

        $item->ItemName = $request->input('ItemName');
        $item->ItemCategory = $request->input('ItemCategory');
        $item->Description = $request->input('Description');

        if ($request->hasFile('item_image')) {
            // Delete existing image
            if ($item->image) {
                unlink(public_path('img/item_img/') . $item->image);
            }

            // Upload new image
            $image = $request->file('item_image');
            $imageName = $image->getClientOriginalName();
            $image->move(public_path('img/item_img/'), $imageName);
            $item->image = $imageName;
        }

        $item->save();

        return redirect()->route('cards.index');
    }

    public function destroy_card($id)
    {
        $item = Item::findOrFail($id);

        // Delete associated image
        if ($item->image) {
            unlink(public_path('img/item_img/') . $item->image);
        }
        $item->delete();

        return redirect()->route('cards.index')->with('success', 'Item deleted successfully.');
    }

    

}
