@extends('admin.layout.app')

@section('content')
    <h1>Card Management</h1>

    <a href="{{ route('cards.create') }}" class="btn btn-success">Create Card</a>

    <table class="table mt-3">
        <thead>
            <tr>
                <th>Item ID</th>
                <th>ItemName</th>
                <th>Category</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($items as $item)
                <tr>
                    <td>{{ $item->ItemID }}</td>
                    <td>{{ $item->ItemName }}</td>
                    <td>{{ $item->ItemCategory }}</td>
                    <td>{{ $item->Description }}</td>
                    <td><img src="{{ asset('img/item_img/' . $item->image) }}" alt="{{ $item->Title }}" class="img-thumbnail" style="width: 50px; height: 50px;"></td>
                    <td>
                        <!-- Add your actions, e.g., edit and delete links/buttons -->
                        <a href="{{ route('cards.edit', $item->ItemID) }}" class="btn btn-primary">Edit</a>
                        <form action="{{ route('cards.destroy', $item->ItemID) }}" method="POST" style="display: inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>

                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6">No cards found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
@endsection
