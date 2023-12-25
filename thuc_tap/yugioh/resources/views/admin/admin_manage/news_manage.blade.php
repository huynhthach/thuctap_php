@extends('admin.layout.app')
@section('content')
<div class="container mt-4">
    <a href="{{ route('news.create') }}" class="btn btn-primary">thêm</a>
    @foreach($db as $row)
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">{{ $row->Title }}</h5>
                <p class="card-text">
                    <strong>Published Date:</strong> {{ $row->PublishedDate }}<br>
                    <strong>Category:</strong> {{ $row->CategoryName }}
                </p>
                <a href="{{ route('news.edit', ['id' => $row->NewsID]) }}" class="btn btn-primary">Sửa</a>
                <form method="post" action="{{ route('news.delete', ['id' => $row->NewsID]) }}" style="display: inline;">
                    @csrf
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </form>
            </div>
        </div>
    @endforeach
</div>
@endsection
</body>
</html>
