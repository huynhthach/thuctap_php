<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\News;
use App\Models\NewsCategories;
class NewsController extends Controller
{
    public function index()
    {
        // Lấy danh sách tin tức và truyền nó đến view
        $newsList = News::with(['details', 'category'])->get();
        return view('news.index', compact('newsList'));
    }

    public function contact()
    {
        return view('news.contact');
    }

    public function show($id)
    {
        // Lấy chi tiết tin tức dựa trên ID và truyền nó đến view
        $news = News::with('category', 'details')->findOrFail($id);
        return view('news.news_detail', compact('news'));
    }
    
    public function category($category)
    {
        // Lấy danh sách tin tức theo danh mục và truyền nó đến view
        $newsList = News::whereHas('category', function ($query) use ($category) {
            $query->where('CategoryName', $category);
        })->with(['details', 'category'])->get();

        return view('news.category', compact('newsList'));
    }
}
