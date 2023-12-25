<style>
    .text{
        padding-top: 50px;
    }
</style>
@extends('layout.app')
@section('content')
<section class="section">
<div class="text">
        <div class="row">
            <div class="col-lg-12">
                <div class="text-center">
                    <h1>{{ $news->Title }}</h1>
                    <p>{{ $news->PublishedDate }}</p>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6 offset-md-3">
                <div class="post-media">
                    @if ($news->details)
                        <img src="{{ asset('img/img_news_detail/' .$news->details->ImagePath) }}" alt="{{ $news->Title }}" class="img-fluid mx-auto d-block" style="max-width: 300px;">
                    @else
                        <p>No image available</p>
                    @endif
                </div><!-- end media -->
            </div><!-- end col -->
        </div><!-- end row -->

        <div class="row mt-4">
            <div class="col-md-12">
                <div class="blog-content">
                    @if ($news->details)
                        <p class="mb-0">{{ $news->details->Content }}</p>
                    @else
                        <p>No content available</p>
                    @endif
                </div><!-- end content -->
            </div><!-- end col -->
        </div>
</div>
</section>
@endsection
