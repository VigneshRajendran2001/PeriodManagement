@extends('layouts.app')

@section('title', 'Register')

@section('content')

<h4 class="text-center">Create Account</h4>


@if(session('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
@endif

<form action="{{ route('register') }}" method="POST">
    @csrf

    <div class="form-group">
        <input type="text" name="username" value="{{ old('username') }}" class="form-control" required placeholder="Enter name">
        @error('username')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <div class="form-group">
        <input type="email" name="email" value="{{ old('email') }}" class="form-control" required placeholder="Enter email">
        @error('email')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <div class="form-group">
        <input type="text" name="phone" value="{{ old('phone') }}" class="form-control" required placeholder="Enter phone number">
        @error('phone')
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
        <input type="password" name="password_confirmation" class="form-control" required placeholder="Confirm password">
    </div>

    <div class="form-group">
        <input type="submit" value="Register" class="btn btn-primary">
    </div>
</form>

<p class="text-center">Already have an account? <a href="{{ route('login') }}">Login Here</a></p>

@endsection
