<!DOCTYPE html>
<html>
<head>
    <title>@yield('title', 'Time Table Management')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- jQuery (required before Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Popper.js (required by Bootstrap 4) -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Bootstrap 4 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap 4 JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container mt-5">
        @yield('content')
    </div>

    @yield('scripts')

</body>
</html>
