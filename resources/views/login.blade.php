@extends('layouts.app')

@section('title', 'Login')

@section('content')
<h4 class="text-center">Login</h4>
   @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
            {{ session('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif
    
<form action="{{ route('login') }}" method="POST">
    @csrf

    <div class="form-group">
        <input type="email" name="email" class="form-control" value="{{ old('email') }}" required placeholder="Enter email">
        @error('email')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <div class="form-group">
        <input type="password" name="password" class="form-control" required placeholder="Enter password">
        @error('password')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <div class="form-group">
        <input type="submit" value="Login" class="btn btn-primary">
    </div>
</form>

<p class="text-center">Don't have an account? <a href="{{ route('register') }}">Register Here</a></p>
@endsection
