<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Reusable modern e-commerce storefront template" />
  <title>NexusShop — Reusable E-Commerce UI</title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

  <style>
    :root {
      --bg: #fafaf8;
      --card: #ffffff;
      --text: #1a1a2e;
      --muted: #6b6b7a;
      --muted-2: #9a9aa8;
      --surface: #f0efed;
      --border: rgba(26, 26, 46, .09);
      --accent: #e07a5f;
      --accent-dark: #c75f43;
      --accent-soft: #f5d8cf;
      --success: #2a9d8f;
      --warning: #e9c46a;
      --danger: #d9534f;
      --shadow: 0 8px 30px rgba(26, 26, 46, .07);
      --shadow-lg: 0 18px 60px rgba(26, 26, 46, .15);
      --radius: 18px;
      --radius-sm: 11px;
      --container: 1240px;
      --transition: .22s ease;
    }

    body.dark {
      --bg: #12131a;
      --card: #1b1d27;
      --text: #f5f5f7;
      --muted: #b6b7c3;
      --muted-2: #858694;
      --surface: #272a35;
      --border: rgba(255,255,255,.09);
      --accent-soft: rgba(224,122,95,.18);
      --shadow: 0 8px 30px rgba(0,0,0,.20);
      --shadow-lg: 0 18px 60px rgba(0,0,0,.40);
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: Inter, system-ui, sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.5;
      transition: background var(--transition), color var(--transition);
    }
    body.locked { overflow: hidden; }
    img { display: block; max-width: 100%; }
    button, input, select { font: inherit; }
    button { border: 0; cursor: pointer; color: inherit; }
    a { color: inherit; text-decoration: none; }
    .container { width: min(100% - 32px, var(--container)); margin: auto; }
    .muted { color: var(--muted); }
    .hidden { display: none !important; }

    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      border-radius: 999px;
      padding: 12px 22px;
      font-weight: 700;
      transition: transform var(--transition), background var(--transition), box-shadow var(--transition);
    }
    .btn-primary { background: var(--accent); color: #fff; }
    .btn-primary:hover { background: var(--accent-dark); transform: translateY(-1px); box-shadow: 0 10px 24px rgba(224,122,95,.28); }
    .btn-dark { background: var(--text); color: var(--bg); }
    .btn-outline { background: transparent; border: 1px solid var(--border); }
    .btn-outline:hover { background: var(--surface); }

    /* Header */
    header {
      position: sticky;
      top: 0;
      z-index: 50;
      background: color-mix(in srgb, var(--card) 92%, transparent);
      backdrop-filter: blur(14px);
      border-bottom: 1px solid var(--border);
    }
    .header-row {
      min-height: 70px;
      display: flex;
      align-items: center;
      gap: 18px;
      justify-content: space-between;
    }
    .brand {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      font-weight: 800;
      font-size: 21px;
      flex-shrink: 0;
    }
    .brand i { color: var(--accent); font-size: 25px; }
    .brand span span { color: var(--accent); }

    nav ul { display: flex; list-style: none; gap: 4px; }
    nav a {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      padding: 9px 13px;
      border-radius: 10px;
      color: var(--muted);
      font-size: 14px;
      font-weight: 600;
    }
    nav a:hover, nav a.active { background: var(--surface); color: var(--text); }

    .header-right { display: flex; align-items: center; gap: 8px; min-width: 0; }
    .search {
      display: flex;
      align-items: center;
      gap: 8px;
      min-width: 250px;
      padding: 0 14px;
      background: var(--surface);
      border: 1px solid transparent;
      border-radius: 999px;
      transition: var(--transition);
    }
    .search:focus-within { background: var(--card); border-color: var(--accent); box-shadow: 0 0 0 4px rgba(224,122,95,.1); }
    .search input {
      width: 100%;
      border: 0;
      outline: 0;
      background: transparent;
      padding: 11px 0;
      color: var(--text);
    }
    .icon-btn {
      width: 42px;
      height: 42px;
      border-radius: 50%;
      display: grid;
      place-items: center;
      background: transparent;
      color: var(--muted);
      position: relative;
    }
    .icon-btn:hover { background: var(--surface); color: var(--text); }
    .badge-count {
      position: absolute;
      right: -2px;
      top: -1px;
      width: 19px;
      height: 19px;
      display: grid;
      place-items: center;
      border-radius: 50%;
      background: var(--accent);
      color: #fff;
      border: 2px solid var(--card);
      font-size: 10px;
      font-weight: 800;
    }
    .mobile-toggle { display: none; }

    /* Hero */
    .hero {
      margin: 20px auto 0;
      min-height: 470px;
      border-radius: var(--radius);
      overflow: hidden;
      position: relative;
      display: flex;
      align-items: center;
      background:
        linear-gradient(90deg, rgba(26,26,46,.94) 0%, rgba(26,26,46,.63) 52%, rgba(26,26,46,.18) 100%),
        url("https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=85") center/cover;
    }
    .hero-content { padding: 64px; max-width: 700px; color: #fff; }
    .eyebrow {
      display: inline-block;
      padding: 6px 13px;
      border-radius: 999px;
      background: rgba(224,122,95,.22);
      color: #ffd8cc;
      font-size: 12px;
      font-weight: 800;
      margin-bottom: 16px;
    }
    .hero h1 {
      font: 700 54px/1.08 "Playfair Display", serif;
      margin-bottom: 16px;
    }
    .hero p { color: rgba(255,255,255,.82); max-width: 560px; font-size: 16px; }
    .hero-actions { display: flex; gap: 10px; flex-wrap: wrap; margin-top: 26px; }
    .btn-hero { background: #fff; color: #1a1a2e; }
    .btn-hero:hover { transform: translateY(-1px); box-shadow: 0 10px 24px rgba(0,0,0,.2); }
    .btn-hero-ghost { color:#fff; border:1px solid rgba(255,255,255,.35); background:rgba(255,255,255,.08); }

    section { padding: 56px 0; }
    .section-head {
      display:flex; align-items:end; justify-content:space-between; gap:16px; margin-bottom:24px;
    }
    .section-head h2 { font-size: 29px; }
    .section-head p { color: var(--muted); font-size: 14px; margin-top: 4px; }
    .link-accent { color: var(--accent); font-weight: 700; font-size: 14px; }

    /* Categories */
    .category-grid {
      display:grid;
      grid-template-columns:repeat(6,1fr);
      gap:14px;
    }
    .category {
      background:var(--card);
      border:1px solid var(--border);
      border-radius:var(--radius);
      padding:22px 12px;
      text-align:center;
      box-shadow:var(--shadow);
      transition:var(--transition);
    }
    .category:hover { transform:translateY(-4px); border-color:var(--accent-soft); }
    .category-icon {
      width:54px; height:54px; margin:0 auto 10px; border-radius:50%;
      display:grid; place-items:center; background:var(--accent-soft); color:var(--accent); font-size:22px;
    }
    .category h3 { font-size:14px; }
    .category small { display:block; margin-top:3px; color:var(--muted); }

    /* Product toolbar */
    .toolbar {
      display:flex; align-items:center; justify-content:space-between; gap:14px; flex-wrap:wrap; margin-bottom:22px;
    }
    .filters { display:flex; gap:8px; overflow:auto; padding-bottom:3px; }
    .chip {
      white-space:nowrap;
      padding:9px 14px;
      border-radius:999px;
      background:var(--surface);
      color:var(--muted);
      font-size:13px;
      font-weight:700;
    }
    .chip.active, .chip:hover { background:var(--text); color:var(--bg); }
    .sort {
      padding:10px 13px;
      border-radius:10px;
      border:1px solid var(--border);
      background:var(--card);
      color:var(--text);
      outline:0;
    }

    /* Products */
    .products {
      display:grid;
      grid-template-columns:repeat(4,1fr);
      gap:18px;
    }
    .product {
      overflow:hidden;
      background:var(--card);
      border:1px solid var(--border);
      border-radius:var(--radius);
      box-shadow:var(--shadow);
      transition:var(--transition);
    }
    .product:hover { transform:translateY(-4px); box-shadow:var(--shadow-lg); }
    .product-image {
      position:relative; aspect-ratio:1/1; overflow:hidden; background:var(--surface);
    }
    .product-image img { width:100%; height:100%; object-fit:cover; transition:transform .35s ease; }
    .product:hover .product-image img { transform:scale(1.045); }
    .product-badge {
      position:absolute; top:12px; left:12px; z-index:2;
      padding:5px 10px; border-radius:999px; font-size:10px; font-weight:800; color:#fff; background:var(--accent);
    }
    .product-badge.sale { background:var(--warning); color:var(--text); }
    .wishlist {
      position:absolute; top:10px; right:10px; width:38px; height:38px;
      border-radius:50%; background:rgba(255,255,255,.92); color:#6b6b7a;
      display:grid; place-items:center; z-index:2;
    }
    .wishlist.active { color:var(--accent); }
    .product-body { padding:16px; }
    .category-label { color:var(--muted-2); text-transform:uppercase; letter-spacing:.5px; font-size:10px; font-weight:800; }
    .product h3 { font-size:15px; margin:6px 0 8px; min-height:40px; }
    .price-row { display:flex; align-items:baseline; gap:8px; }
    .price { font-size:19px; font-weight:800; }
    .old-price { font-size:13px; color:var(--muted-2); text-decoration:line-through; }
    .rating { color:#f4a623; font-size:12px; margin:8px 0 13px; }
    .rating span { color:var(--muted); margin-left:5px; }
    .add-cart { width:100%; padding:11px; border-radius:10px; background:var(--text); color:var(--bg); font-size:13px; font-weight:800; }
    .add-cart:hover { background:var(--accent); color:#fff; }

    .empty-results {
      grid-column:1/-1;
      padding:60px 20px;
      text-align:center;
      color:var(--muted);
      background:var(--card);
      border:1px dashed var(--border);
      border-radius:var(--radius);
    }

    /* Deal */
    .deal {
      display:grid; grid-template-columns:1fr 1fr; overflow:hidden;
      background:var(--card); border:1px solid var(--border); border-radius:var(--radius); box-shadow:var(--shadow);
    }
    .deal-image { min-height:360px; }
    .deal-image img { width:100%; height:100%; object-fit:cover; }
    .deal-content { padding:46px; display:flex; flex-direction:column; justify-content:center; }
    .deal-tag { align-self:flex-start; background:var(--warning); color:var(--text); padding:5px 12px; border-radius:999px; font-size:11px; font-weight:800; }
    .deal-content h3 { font-size:32px; margin:14px 0 8px; }
    .deal-price { font-size:34px; font-weight:800; margin:10px 0; }
    .deal-price del { color:var(--muted-2); font-size:20px; margin-left:8px; font-weight:500; }
    .stock { color:var(--muted); font-size:13px; }
    .stock strong { color:var(--accent); }
    .timer { display:flex; gap:10px; margin:20px 0; }
    .time-box { min-width:66px; background:var(--text); color:var(--bg); border-radius:11px; text-align:center; padding:9px 10px; }
    .time-box strong { display:block; font-size:23px; }
    .time-box small { font-size:9px; opacity:.65; text-transform:uppercase; }

    /* Testimonials */
    .testimonial-grid { display:grid; grid-template-columns:repeat(4,1fr); gap:16px; }
    .testimonial {
      background:var(--card); border:1px solid var(--border); border-radius:var(--radius);
      padding:22px; box-shadow:var(--shadow);
    }
    .stars { color:#f4a623; margin-bottom:10px; letter-spacing:2px; }
    .testimonial p { color:var(--muted); font-size:14px; min-height:66px; }
    .reviewer { display:flex; align-items:center; gap:10px; margin-top:16px; }
    .reviewer img { width:42px; height:42px; border-radius:50%; object-fit:cover; }
    .reviewer b { display:block; font-size:13px; }
    .reviewer small { color:var(--muted); }

    /* Newsletter + footer */
    .newsletter {
      padding:42px; border-radius:var(--radius); color:#fff;
      background:linear-gradient(135deg,#1a1a2e,#31324a);
      display:flex; align-items:center; justify-content:space-between; gap:24px; flex-wrap:wrap;
    }
    .newsletter h3 { font-size:26px; }
    .newsletter p { color:rgba(255,255,255,.68); margin-top:4px; }
    .newsletter form { display:flex; gap:8px; width:min(100%,500px); }
    .newsletter input {
      flex:1; min-width:0; border:1px solid rgba(255,255,255,.12); border-radius:999px;
      background:rgba(255,255,255,.1); color:#fff; padding:12px 17px; outline:0;
    }
    .newsletter input::placeholder { color:rgba(255,255,255,.55); }
    .newsletter-msg { width:100%; font-size:13px; }

    footer { padding:44px 0 28px; border-top:1px solid var(--border); margin-top:15px; }
    .footer-grid { display:grid; grid-template-columns:2fr 1fr 1fr 1fr; gap:30px; }
    .footer-grid h4 { font-size:14px; margin-bottom:11px; }
    .footer-grid a, .footer-grid p { color:var(--muted); font-size:13px; }
    .footer-grid ul { list-style:none; display:grid; gap:7px; }
    .socials { display:flex; gap:8px; margin-top:14px; }
    .socials a { width:38px; height:38px; border-radius:50%; display:grid; place-items:center; background:var(--surface); }
    .footer-bottom { text-align:center; color:var(--muted-2); font-size:12px; border-top:1px solid var(--border); margin-top:28px; padding-top:18px; }

    /* Cart drawer */
    .overlay {
      position:fixed; inset:0; background:rgba(0,0,0,.48); opacity:0; visibility:hidden;
      transition:.25s; z-index:90;
    }
    .overlay.open { opacity:1; visibility:visible; }
    .drawer {
      position:fixed; top:0; right:0; z-index:100; width:min(430px,100%); height:100vh;
      background:var(--card); transform:translateX(102%); transition:.3s ease;
      box-shadow:-20px 0 60px rgba(0,0,0,.2); display:flex; flex-direction:column;
    }
    .drawer.open { transform:translateX(0); }
    .drawer-head, .drawer-foot { padding:20px; border-bottom:1px solid var(--border); }
    .drawer-head { display:flex; justify-content:space-between; align-items:center; }
    .drawer-body { flex:1; overflow:auto; padding:14px 20px; }
    .cart-item { display:grid; grid-template-columns:70px 1fr auto; gap:11px; align-items:center; padding:13px 0; border-bottom:1px solid var(--border); }
    .cart-item img { width:70px; height:70px; object-fit:cover; border-radius:11px; }
    .cart-item h4 { font-size:13px; }
    .cart-item p { font-size:12px; color:var(--muted); margin-top:3px; }
    .qty { display:flex; align-items:center; gap:7px; margin-top:7px; }
    .qty button { width:25px; height:25px; border-radius:7px; background:var(--surface); }
    .remove { color:var(--accent); font-size:11px; }
    .cart-total { display:flex; justify-content:space-between; font-size:18px; font-weight:800; margin-bottom:12px; }

    /* Modals */
    .modal-wrap {
      position:fixed; inset:0; z-index:120; background:rgba(0,0,0,.55); display:none; place-items:center; padding:18px;
    }
    .modal-wrap.open { display:grid; }
    .modal {
      width:min(460px,100%); background:var(--card); color:var(--text);
      border-radius:20px; padding:26px; box-shadow:var(--shadow-lg);
    }
    .modal-head { display:flex; align-items:center; justify-content:space-between; margin-bottom:18px; }
    .modal-head h3 { font-size:21px; }
    .form-group { display:grid; gap:6px; margin-bottom:12px; }
    .form-group label { font-size:12px; font-weight:800; }
    .form-group input {
      border:1px solid var(--border); background:var(--surface); color:var(--text);
      border-radius:10px; padding:12px; outline:0;
    }
    .form-group input:focus { border-color:var(--accent); }
    .modal-note { color:var(--muted); font-size:12px; margin-top:12px; text-align:center; }

    @media (max-width: 1100px) {
      nav { display:none; }
      .mobile-toggle { display:grid; }
      .products { grid-template-columns:repeat(3,1fr); }
      .category-grid { grid-template-columns:repeat(3,1fr); }
      .testimonial-grid { grid-template-columns:repeat(2,1fr); }
    }
    @media (max-width: 760px) {
      .container { width:min(100% - 20px, var(--container)); }
      .header-row { gap:8px; }
      .brand { font-size:18px; }
      .search { min-width:0; flex:1; }
      .header-right { flex:1; justify-content:flex-end; }
      .search input { min-width:60px; }
      .hero { min-height:390px; }
      .hero-content { padding:32px 24px; }
      .hero h1 { font-size:37px; }
      .products { grid-template-columns:repeat(2,1fr); gap:12px; }
      .category-grid { grid-template-columns:repeat(2,1fr); gap:10px; }
      .deal { grid-template-columns:1fr; }
      .deal-image { min-height:240px; }
      .deal-content { padding:28px 22px; }
      .footer-grid { grid-template-columns:1fr 1fr; }
      .newsletter { padding:28px 22px; }
      .newsletter form { width:100%; }
      section { padding:42px 0; }
    }
    @media (max-width: 480px) {
      .header-right .theme-btn { display:none; }
      .products { gap:10px; }
      .product-body { padding:12px; }
      .product h3 { font-size:13px; min-height:36px; }
      .price { font-size:16px; }
      .old-price { font-size:11px; }
      .add-cart { padding:9px; font-size:12px; }
      .testimonial-grid { grid-template-columns:1fr; }
      .footer-grid { grid-template-columns:1fr; }
      .section-head { align-items:start; }
      .section-head h2 { font-size:23px; }
      .deal-price { font-size:28px; }
      .time-box { min-width:54px; }
      .time-box strong { font-size:18px; }
    }
  </style>
</head>
<body>

<header>
  <div class="container header-row">
    <div style="display:flex;align-items:center;gap:8px;">
      <button class="icon-btn mobile-toggle" id="mobileBtn" aria-label="Open navigation"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#home"><i class="fas fa-store"></i><span>Nexus<span>Shop</span></span></a>
    </div>

    <nav id="desktopNav">
      <ul>
        <li><a class="active" href="#home">Home</a></li>
        <li><a href="#categories">Categories</a></li>
        <li><a href="#products">Products</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#reviews">Reviews</a></li>
      </ul>
    </nav>

    <div class="header-right">
      <label class="search">
        <i class="fas fa-search muted"></i>
        <input id="searchInput" type="search" placeholder="Search products..." autocomplete="off">
      </label>
      <button class="icon-btn theme-btn" id="themeBtn" title="Toggle theme" aria-label="Toggle theme"><i class="far fa-moon"></i></button>
      <button class="icon-btn" id="accountBtn" title="Account" aria-label="Open account"><i class="far fa-user"></i></button>
      <button class="icon-btn" id="wishlistBtn" title="Wishlist" aria-label="Open wishlist"><i class="far fa-heart"></i></button>
      <button class="icon-btn" id="cartBtn" title="Cart" aria-label="Open cart">
        <i class="fas fa-shopping-bag"></i>
        <span class="badge-count" id="cartCount">0</span>
      </button>
    </div>
  </div>
</header>

<div class="overlay" id="overlay"></div>

<section id="home">
  <div class="container hero">
    <div class="hero-content">
      <span class="eyebrow">NEW COLLECTION • 2026</span>
      <h1>Discover products you'll love.</h1>
      <p>Reusable e-commerce UI with modern product discovery, a real cart drawer, filters, sorting, wishlist interactions, dark mode, and a demo checkout.</p>
      <div class="hero-actions">
        <a class="btn btn-hero" href="#products"><i class="fas fa-arrow-right"></i> Shop Now</a>
        <a class="btn btn-hero-ghost" href="#deals"><i class="fas fa-bolt"></i> View Deals</a>
      </div>
    </div>
  </div>
</section>

<section id="categories">
  <div class="container">
    <div class="section-head">
      <div><h2>Browse Categories</h2><p>Start shopping by category</p></div>
      <button class="link-accent" id="allCategoriesBtn">View all</button>
    </div>
    <div class="category-grid" id="categoryGrid"></div>
  </div>
</section>

<section id="products">
  <div class="container">
    <div class="section-head">
      <div><h2>Trending Now</h2><p>Popular products from the catalog</p></div>
      <span class="link-accent" id="resultCount">0 products</span>
    </div>

    <div class="toolbar">
      <div class="filters" id="filters"></div>
      <select class="sort" id="sortSelect" aria-label="Sort products">
        <option value="featured">Sort: Featured</option>
        <option value="low">Price: Low to High</option>
        <option value="high">Price: High to Low</option>
        <option value="rating">Top Rated</option>
        <option value="name">Name: A–Z</option>
      </select>
    </div>

    <div class="products" id="productGrid"></div>
  </div>
</section>

<section id="deals">
  <div class="container">
    <div class="section-head">
      <div><h2>⚡ Flash Deal</h2><p>Limited-time offer</p></div>
    </div>
    <div class="deal">
      <div class="deal-image">
        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1000&q=85" alt="Laptop flash deal">
      </div>
      <div class="deal-content">
        <span class="deal-tag">LIMITED OFFER</span>
        <h3 id="dealName">MacBook Air M2</h3>
        <p class="muted">Slim, powerful, and ready for work, study, or entertainment.</p>
        <div class="deal-price" id="dealPrice">$999 <del>$1,199</del></div>
        <p class="stock">Only <strong id="dealStock">12</strong> items left.</p>
        <div class="timer">
          <div class="time-box"><strong id="dDays">0</strong><small>Days</small></div>
          <div class="time-box"><strong id="dHours">00</strong><small>Hours</small></div>
          <div class="time-box"><strong id="dMins">00</strong><small>Minutes</small></div>
          <div class="time-box"><strong id="dSecs">00</strong><small>Seconds</small></div>
        </div>
        <button class="btn btn-primary" id="dealAdd"><i class="fas fa-cart-plus"></i> Add Deal to Cart</button>
      </div>
    </div>
  </div>
</section>

<section id="reviews">
  <div class="container">
    <div class="section-head">
      <div><h2>What Customers Say</h2><p>Example testimonial cards</p></div>
    </div>
    <div class="testimonial-grid" id="reviewGrid"></div>
  </div>
</section>

<section>
  <div class="container">
    <div class="newsletter">
      <div>
        <h3>Stay in the loop</h3>
        <p>Get product updates, new arrivals, and special offers.</p>
      </div>
      <form id="newsletterForm">
        <input id="newsletterEmail" type="email" placeholder="you@example.com" required>
        <button class="btn btn-primary" type="submit">Subscribe</button>
      </form>
      <div class="newsletter-msg" id="newsletterMsg"></div>
    </div>
  </div>
</section>

<footer>
  <div class="container">
    <div class="footer-grid">
      <div>
        <a class="brand" href="#home"><i class="fas fa-store"></i><span>Nexus<span>Shop</span></span></a>
        <p style="margin-top:9px;">A reusable, single-file e-commerce front-end template.</p>
        <div class="socials">
          <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
          <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
      <div><h4>Shop</h4><ul><li><a href="#products">All Products</a></li><li><a href="#categories">Categories</a></li><li><a href="#deals">Deals</a></li></ul></div>
      <div><h4>Support</h4><ul><li><a href="#">Help Center</a></li><li><a href="#">Shipping</a></li><li><a href="#">Returns</a></li></ul></div>
      <div><h4>Company</h4><ul><li><a href="#">About</a></li><li><a href="#">Contact</a></li><li><a href="#">Privacy</a></li></ul></div>
    </div>
    <div class="footer-bottom">© <span id="year"></span> NexusShop. All rights reserved.</div>
  </div>
</footer>

<!-- Cart drawer -->
<aside class="drawer" id="cartDrawer" aria-label="Shopping cart">
  <div class="drawer-head">
    <h3>My Cart <span class="muted" id="cartLabel"></span></h3>
    <button class="icon-btn" id="closeCart" aria-label="Close cart"><i class="fas fa-times"></i></button>
  </div>
  <div class="drawer-body" id="cartItems"></div>
  <div class="drawer-foot">
    <div class="cart-total"><span>Total</span><span id="cartTotal">$0</span></div>
    <button class="btn btn-primary" style="width:100%;" id="checkoutBtn"><i class="fas fa-lock"></i> Secure Checkout</button>
  </div>
</aside>

<!-- Account modal -->
<div class="modal-wrap" id="accountModal">
  <div class="modal">
    <div class="modal-head">
      <h3>Welcome Back</h3>
      <button class="icon-btn" data-close="accountModal" aria-label="Close"><i class="fas fa-times"></i></button>
    </div>
    <form id="loginForm">
      <div class="form-group"><label>Email</label><input type="email" required placeholder="you@example.com"></div>
      <div class="form-group"><label>Password</label><input type="password" required placeholder="Your password"></div>
      <button class="btn btn-primary" style="width:100%;" type="submit">Sign In</button>
    </form>
    <p class="modal-note">Demo only. No credentials are stored.</p>
  </div>
</div>

<!-- Checkout modal -->
<div class="modal-wrap" id="checkoutModal">
  <div class="modal">
    <div class="modal-head">
      <h3>Checkout</h3>
      <button class="icon-btn" data-close="checkoutModal" aria-label="Close"><i class="fas fa-times"></i></button>
    </div>
    <form id="checkoutForm">
      <div class="form-group"><label>Full Name</label><input required placeholder="Your name"></div>
      <div class="form-group"><label>Delivery Address</label><input required placeholder="Street, city and postal code"></div>
      <div class="form-group"><label>Payment Method</label><input required placeholder="Card / UPI / COD"></div>
      <button class="btn btn-primary" style="width:100%;" type="submit"><i class="fas fa-check-circle"></i> Place Demo Order</button>
    </form>
    <p class="modal-note">This checkout is a front-end demo; connect your real payment/backend flow here.</p>
  </div>
</div>

<script>
  /*
   * ============================================================
   * 1) EASY-TO-EDIT CONFIGURATION
   * ============================================================
   */
  const CONFIG = {
    currency: "USD",       // Change to "INR", "EUR", etc.
    locale: "en-US",       // Example for India: "en-IN"
    storageKey: "nexusshop-state",
    dealDurationHours: 24
  };

  /*
   * ============================================================
   * 2) PRODUCT DATA
   *    Replace these objects with your own products.
   * ============================================================
   */
  const PRODUCTS = [
    {
      id: 1,
      title: "iPhone 14 Pro Max",
      category: "Smartphones",
      price: 1099,
      oldPrice: 1199,
      rating: 5,
      reviews: 128,
      badge: "New",
      image: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 2,
      title: 'MacBook Pro 14"',
      category: "Laptops",
      price: 1999,
      rating: 4,
      reviews: 86,
      image: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 3,
      title: "Apple Watch Series 8",
      category: "Accessories",
      price: 349,
      oldPrice: 399,
      rating: 5,
      reviews: 214,
      badge: "Sale",
      image: "https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 4,
      title: "Nike Air Max 270",
      category: "Footwear",
      price: 150,
      rating: 4,
      reviews: 53,
      image: "https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 5,
      title: "Sony A7 IV Camera",
      category: "Gadgets",
      price: 2499,
      rating: 5,
      reviews: 42,
      badge: "New",
      image: "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 6,
      title: "Chanel No. 5",
      category: "Accessories",
      price: 120,
      rating: 5,
      reviews: 189,
      image: "https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 7,
      title: "Travel Backpack",
      category: "Accessories",
      price: 79,
      oldPrice: 99,
      rating: 4,
      reviews: 67,
      badge: "Sale",
      image: "https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=800&q=85"
    },
    {
      id: 8,
      title: "Sony WH-1000XM5",
      category: "Gadgets",
      price: 399,
      rating: 5,
      reviews: 156,
      image: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=800&q=85"
    }
  ];

  const CATEGORIES = [
    { name: "Smartphones", icon: "fa-mobile-screen-button" },
    { name: "Laptops", icon: "fa-laptop" },
    { name: "Clothing", icon: "fa-shirt" },
    { name: "Gadgets", icon: "fa-headphones" },
    { name: "Footwear", icon: "fa-shoe-prints" },
    { name: "Accessories", icon: "fa-watch" }
  ];

  const REVIEWS = [
    ["Ava Martin", "Verified Buyer", 5, "Fast shipping and excellent support. The product exceeded my expectations.", "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80"],
    ["Michael Lee", "Frequent Shopper", 4, "Great selection and a smooth shopping experience. I will definitely shop again.", "https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=100&q=80"],
    ["Sophia Chen", "Designer", 5, "Love the quality and packaging. Everything arrived in perfect condition.", "https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=100&q=80"],
    ["James Wilson", "Tech Enthusiast", 5, "Amazing prices on electronics. The laptop deal was unbeatable.", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80"]
  ];

  const DEAL = {
    id: 999,
    title: "MacBook Air M2",
    category: "Laptops",
    price: 999,
    oldPrice: 1199,
    stock: 12,
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1000&q=85"
  };

  /*
   * ============================================================
   * 3) APP STATE
   * ============================================================
   */
  const state = {
    activeCategory: "All",
    search: "",
    sort: "featured",
    cart: [],
    wishlist: [],
    dark: false,
    dealEndsAt: Date.now() + CONFIG.dealDurationHours * 60 * 60 * 1000
  };

  const $ = (id) => document.getElementById(id);

  function money(value) {
    return new Intl.NumberFormat(CONFIG.locale, {
      style: "currency",
      currency: CONFIG.currency,
      maximumFractionDigits: 0
    }).format(value);
  }

  function escapeHtml(value) {
    return String(value).replace(/[&<>"']/g, char => ({
      "&": "&amp;",
      "<": "&lt;",
      ">": "&gt;",
      '"': "&quot;",
      "'": "&#39;"
    }[char]));
  }

  function saveState() {
    localStorage.setItem(CONFIG.storageKey, JSON.stringify({
      cart: state.cart,
      wishlist: state.wishlist,
      dark: state.dark,
      dealEndsAt: state.dealEndsAt
    }));
  }

  function loadState() {
    try {
      const saved = JSON.parse(localStorage.getItem(CONFIG.storageKey) || "null");
      if (!saved) return;
      state.cart = Array.isArray(saved.cart) ? saved.cart : [];
      state.wishlist = Array.isArray(saved.wishlist) ? saved.wishlist : [];
      state.dark = !!saved.dark;
      if (saved.dealEndsAt && saved.dealEndsAt > Date.now()) state.dealEndsAt = saved.dealEndsAt;
    } catch (error) {
      console.warn("Could not restore saved state:", error);
    }
  }

  /*
   * ============================================================
   * 4) RENDER
   * ============================================================
   */
  function renderCategories() {
    $("categoryGrid").innerHTML = CATEGORIES.map(cat => `
      <button class="category" data-category="${escapeHtml(cat.name)}">
        <div class="category-icon"><i class="fas ${cat.icon}"></i></div>
        <h3>${escapeHtml(cat.name)}</h3>
        <small>Explore products</small>
      </button>
    `).join("");
  }

  function renderFilters() {
    const categories = ["All", ...CATEGORIES.map(c => c.name)];
    $("filters").innerHTML = categories.map(cat => `
      <button class="chip ${state.activeCategory === cat ? "active" : ""}" data-filter="${escapeHtml(cat)}">
        ${escapeHtml(cat)}
      </button>
    `).join("");
  }

  function getVisibleProducts() {
    const query = state.search.trim().toLowerCase();

    let list = PRODUCTS.filter(product => {
      const matchesSearch =
        !query ||
        product.title.toLowerCase().includes(query) ||
        product.category.toLowerCase().includes(query);

      const matchesCategory =
        state.activeCategory === "All" ||
        product.category === state.activeCategory;

      return matchesSearch && matchesCategory;
    });

    if (state.sort === "low") list.sort((a, b) => a.price - b.price);
    if (state.sort === "high") list.sort((a, b) => b.price - a.price);
    if (state.sort === "rating") list.sort((a, b) => b.rating - a.rating || b.reviews - a.reviews);
    if (state.sort === "name") list.sort((a, b) => a.title.localeCompare(b.title));

    return list;
  }

  function stars(rating) {
    return "★".repeat(Math.round(rating)) + "☆".repeat(5 - Math.round(rating));
  }

  function renderProducts() {
    const products = getVisibleProducts();
    $("resultCount").textContent = `${products.length} product${products.length === 1 ? "" : "s"}`;

    if (!products.length) {
      $("productGrid").innerHTML = `
        <div class="empty-results">
          <i class="fas fa-magnifying-glass" style="font-size:32px;margin-bottom:10px;"></i>
          <h3>No products found</h3>
          <p style="margin-top:4px;">Try another search or category.</p>
        </div>`;
      return;
    }

    $("productGrid").innerHTML = products.map(product => `
      <article class="product">
        <div class="product-image">
          ${product.badge ? `<span class="product-badge ${product.badge === "Sale" ? "sale" : ""}">${escapeHtml(product.badge)}</span>` : ""}
          <button class="wishlist ${state.wishlist.includes(product.id) ? "active" : ""}" data-wishlist="${product.id}" aria-label="Toggle wishlist">
            <i class="${state.wishlist.includes(product.id) ? "fas" : "far"} fa-heart"></i>
          </button>
          <img src="${product.image}" alt="${escapeHtml(product.title)}" loading="lazy">
        </div>
        <div class="product-body">
          <div class="category-label">${escapeHtml(product.category)}</div>
          <h3>${escapeHtml(product.title)}</h3>
          <div class="price-row">
            <strong class="price">${money(product.price)}</strong>
            ${product.oldPrice ? `<span class="old-price">${money(product.oldPrice)}</span>` : ""}
          </div>
          <div class="rating">${stars(product.rating)} <span>(${product.reviews})</span></div>
          <button class="add-cart" data-add="${product.id}"><i class="fas fa-cart-plus"></i> Add to Cart</button>
        </div>
      </article>
    `).join("");
  }

  function renderReviews() {
    $("reviewGrid").innerHTML = REVIEWS.map(review => `
      <article class="testimonial">
        <div class="stars">${stars(review[2])}</div>
        <p>“${escapeHtml(review[3])}”</p>
        <div class="reviewer">
          <img src="${review[4]}" alt="${escapeHtml(review[0])}">
          <div><b>${escapeHtml(review[0])}</b><small>${escapeHtml(review[1])}</small></div>
        </div>
      </article>
    `).join("");
  }

  function cartQuantity() {
    return state.cart.reduce((total, item) => total + item.qty, 0);
  }

  function cartTotal() {
    return state.cart.reduce((total, item) => total + item.price * item.qty, 0);
  }

  function renderCart() {
    const quantity = cartQuantity();
    $("cartCount").textContent = quantity;
    $("cartLabel").textContent = quantity ? `(${quantity})` : "";
    $("cartTotal").textContent = money(cartTotal());

    if (!state.cart.length) {
      $("cartItems").innerHTML = `
        <div class="empty-results" style="margin-top:10px;">
          <i class="fas fa-shopping-bag" style="font-size:35px;margin-bottom:9px;"></i>
          <p>Your cart is empty.</p>
        </div>`;
      return;
    }

    $("cartItems").innerHTML = state.cart.map(item => `
      <div class="cart-item">
        <img src="${item.image}" alt="${escapeHtml(item.title)}">
        <div>
          <h4>${escapeHtml(item.title)}</h4>
          <p>${money(item.price)}</p>
          <div class="qty">
            <button data-qty="${item.id}" data-change="-1">−</button>
            <strong>${item.qty}</strong>
            <button data-qty="${item.id}" data-change="1">+</button>
            <button class="remove" data-remove="${item.id}">Remove</button>
          </div>
        </div>
      </div>
    `).join("");
  }

  function openCart() {
    $("cartDrawer").classList.add("open");
    $("overlay").classList.add("open");
    document.body.classList.add("locked");
  }

  function closeCart() {
    $("cartDrawer").classList.remove("open");
    $("overlay").classList.remove("open");
    document.body.classList.remove("locked");
  }

  function openModal(id) {
    $(id).classList.add("open");
    document.body.classList.add("locked");
  }

  function closeModal(id) {
    $(id).classList.remove("open");
    if (![...document.querySelectorAll(".modal-wrap.open")].length && !$("cartDrawer").classList.contains("open")) {
      document.body.classList.remove("locked");
    }
  }

  function addToCart(id, qty = 1) {
    const product = id === DEAL.id ? DEAL : PRODUCTS.find(p => p.id === id);
    if (!product) return;

    const existing = state.cart.find(item => item.id === id);
    if (existing) existing.qty += qty;
    else state.cart.push({ ...product, qty });

    saveState();
    renderCart();
    openCart();
  }

  function toggleWishlist(id) {
    const index = state.wishlist.indexOf(id);
    if (index >= 0) state.wishlist.splice(index, 1);
    else state.wishlist.push(id);
    saveState();
    renderProducts();
  }

  function updateTheme() {
    document.body.classList.toggle("dark", state.dark);
    $("themeBtn").innerHTML = state.dark
      ? '<i class="fas fa-sun"></i>'
      : '<i class="far fa-moon"></i>';
  }

  /*
   * ============================================================
   * 5) DEAL TIMER
   * ============================================================
   */
  function renderTimer() {
    let diff = Math.max(0, state.dealEndsAt - Date.now());

    const days = Math.floor(diff / 86400000);
    diff %= 86400000;
    const hours = Math.floor(diff / 3600000);
    diff %= 3600000;
    const mins = Math.floor(diff / 60000);
    const secs = Math.floor((diff % 60000) / 1000);

    $("dDays").textContent = days;
    $("dHours").textContent = String(hours).padStart(2, "0");
    $("dMins").textContent = String(mins).padStart(2, "0");
    $("dSecs").textContent = String(secs).padStart(2, "0");
  }

  /*
   * ============================================================
   * 6) EVENTS
   * ============================================================
   */
  $("searchInput").addEventListener("input", event => {
    state.search = event.target.value;
    renderProducts();
  });

  $("sortSelect").addEventListener("change", event => {
    state.sort = event.target.value;
    renderProducts();
  });

  $("filters").addEventListener("click", event => {
    const button = event.target.closest("[data-filter]");
    if (!button) return;
    state.activeCategory = button.dataset.filter;
    renderFilters();
    renderProducts();
  });

  $("categoryGrid").addEventListener("click", event => {
    const button = event.target.closest("[data-category]");
    if (!button) return;
    state.activeCategory = button.dataset.category;
    state.search = "";
    $("searchInput").value = "";
    renderFilters();
    renderProducts();
    document.querySelector("#products").scrollIntoView({ behavior: "smooth" });
  });

  $("allCategoriesBtn").addEventListener("click", () => {
    state.activeCategory = "All";
    state.search = "";
    $("searchInput").value = "";
    renderFilters();
    renderProducts();
    document.querySelector("#products").scrollIntoView({ behavior: "smooth" });
  });

  $("productGrid").addEventListener("click", event => {
    const add = event.target.closest("[data-add]");
    const wish = event.target.closest("[data-wishlist]");
    if (add) addToCart(Number(add.dataset.add));
    if (wish) toggleWishlist(Number(wish.dataset.wishlist));
  });

  $("cartItems").addEventListener("click", event => {
    const qtyButton = event.target.closest("[data-qty]");
    const removeButton = event.target.closest("[data-remove]");

    if (qtyButton) {
      const id = Number(qtyButton.dataset.qty);
      const change = Number(qtyButton.dataset.change);
      const item = state.cart.find(x => x.id === id);
      if (!item) return;
      item.qty += change;
      state.cart = state.cart.filter(x => x.qty > 0);
      saveState();
      renderCart();
    }

    if (removeButton) {
      const id = Number(removeButton.dataset.remove);
      state.cart = state.cart.filter(x => x.id !== id);
      saveState();
      renderCart();
    }
  });

  $("cartBtn").addEventListener("click", openCart);
  $("closeCart").addEventListener("click", closeCart);
  $("overlay").addEventListener("click", closeCart);

  $("themeBtn").addEventListener("click", () => {
    state.dark = !state.dark;
    updateTheme();
    saveState();
  });

  $("accountBtn").addEventListener("click", () => openModal("accountModal"));

  $("wishlistBtn").addEventListener("click", () => {
    const count = state.wishlist.length;
    alert(count ? `You have ${count} item${count === 1 ? "" : "s"} in your wishlist.` : "Your wishlist is empty.");
  });

  document.querySelectorAll("[data-close]").forEach(button => {
    button.addEventListener("click", () => closeModal(button.dataset.close));
  });

  document.querySelectorAll(".modal-wrap").forEach(modal => {
    modal.addEventListener("click", event => {
      if (event.target === modal) closeModal(modal.id);
    });
  });

  $("loginForm").addEventListener("submit", event => {
    event.preventDefault();
    closeModal("accountModal");
    alert("Welcome back! This is a demo login.");
  });

  $("checkoutBtn").addEventListener("click", () => {
    if (!state.cart.length) {
      alert("Your cart is empty.");
      return;
    }
    openModal("checkoutModal");
  });

  $("checkoutForm").addEventListener("submit", event => {
    event.preventDefault();
    const orderTotal = cartTotal();
    state.cart = [];
    saveState();
    renderCart();
    closeModal("checkoutModal");
    closeCart();
    alert(`Order placed successfully. Demo total: ${money(orderTotal)}.`);
  });

  $("dealAdd").addEventListener("click", () => addToCart(DEAL.id));

  $("newsletterForm").addEventListener("submit", event => {
    event.preventDefault();
    $("newsletterMsg").textContent = "🎉 Thanks for subscribing!";
    $("newsletterEmail").value = "";
  });

  // Lightweight mobile nav for smaller screens.
  $("mobileBtn").addEventListener("click", () => {
    const nav = $("desktopNav");
    const isOpen = nav.dataset.open === "true";
    nav.dataset.open = String(!isOpen);
    nav.style.display = isOpen ? "" : "block";
    nav.style.position = isOpen ? "" : "absolute";
    nav.style.top = "70px";
    nav.style.left = "0";
    nav.style.right = "0";
    nav.style.background = "var(--card)";
    nav.style.borderBottom = "1px solid var(--border)";
    if (!isOpen) nav.querySelector("ul").style.display = "flex";
  });

  /*
   * ============================================================
   * 7) INIT
   * ============================================================
   */
  loadState();
  updateTheme();
  renderCategories();
  renderFilters();
  renderProducts();
  renderReviews();
  renderCart();
  renderTimer();
  $("year").textContent = new Date().getFullYear();

  setInterval(renderTimer, 1000);

  console.log("NexusShop reusable e-commerce UI loaded.");
</script>

</body>
</html>
