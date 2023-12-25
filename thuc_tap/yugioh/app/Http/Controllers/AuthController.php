<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User; // Fix the namespace
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
class AuthController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        if (!Auth::check()) {
            $user = User::where('Username', '=', $request->get('Username'))->first();
    
            if ($user && Hash::check($request->password, $user->Password)) {
                // Đăng nhập thành công
                Auth::login($user);
    
                // Chuyển hướng tùy thuộc vào 'IDRole'
                return redirect()->route($user->IDRole == 2 ? 'admin' : 'home');
            }
        }
    
        // Đăng nhập không thành công hoặc đã đăng nhập trước đó
        return redirect()->route('login')->with('error', 'Đăng nhập không thành công');
    }
    
    

    public function showRegistrationForm()
    {
        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
            'Username' => 'required|unique:users',
            'Email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
        ]);

        $user = new User; // Fix the model name
        $user->Username = $request->input('Username');
        $user->Email = $request->input('Email');
        $user->Password  = Hash::make($request->input('password'));
        $user->NgayTao = now();
        $user->IDRole = 1; // Role mặc định

        $user->save();

        return redirect()->route('login');
    }

    public function logout()
    {
        Auth::logout();

        return redirect()->route('home');
    }

    public function showForgotPasswordForm()
    {
        return view('auth.forgot-password');
    }

    public function CheckEmail(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $user = User::where('Email', $request->email)->first();

        if ($user) {
            return redirect()->route('password.reset', ['userId' => $user->UserID]);
        }

        return back()->withErrors(['email' => 'Không tìm thấy người dùng với địa chỉ email này']);
    }

    public function showResetPasswordForm($id)
    {
        $user = User::findOrFail($id);
        return view('auth.reset-password', ['user' => $user]);
    }

    public function resetPassword(Request $request, $id)
    {
        $request->validate([
            'password' => 'required|confirmed',
        ]);

        $user = User::find($id);

        if ($user) {
            // Cập nhật mật khẩu
            $user->Password = Hash::make($request->input('password'));
            $user->save();

            return redirect()->route('login')->with('status', 'Mật khẩu đã được đặt lại thành công');
        }

        return back()->withErrors(['email' => 'Thông tin không hợp lệ']);
    }
}
