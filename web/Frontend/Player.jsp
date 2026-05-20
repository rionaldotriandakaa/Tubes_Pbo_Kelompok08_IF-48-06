<%-- 
    Document   : Player
    Created on : May 20, 2026, 9:08:50 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Backend.model.Konten"%>
<%@page import="Backend.model.Film"%>
<%@page import="Backend.model.Series"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineStream - Player</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/player.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #050816;
            color: white;
            overflow-x: hidden;
        }

        /* ── NAVBAR ── */

        .navbar {
            width: 100%;
            height: 80px;
            padding: 0 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            z-index: 100;
            background: rgba(0,0,0,0.25);
            backdrop-filter: blur(12px);
        }

        .logo {
            font-size: 32px;
            font-weight: 700;
            color: #ff9b9b;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 35px;
        }

        .nav-links a {
            text-decoration: none;
            color: #ddd;
            font-size: 14px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #ff9b9b;
        }

        .profile {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #ff9b9b;
        }

        /* ── HERO PLAYER ── */

        .player-hero {
            padding-top: 80px;
            min-height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
        }

        .hero-bg {
            position: absolute;
            inset: 0;
            background-size: cover;
            background-position: center;
            filter: blur(2px) brightness(0.35);
            z-index: 0;
        }

        .hero-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(
                to right,
                rgba(5,8,22,0.98) 40%,
                rgba(5,8,22,0.5)
            );
            z-index: 1;
        }

        .player-content {
            position: relative;
            z-index: 2;
            width: 100%;
            padding: 60px 80px;
            display: grid;
            grid-template-columns: 1fr 420px;
            gap: 60px;
            align-items: start;
        }

        /* ── INFO KIRI ── */

        .movie-left .badge {
            display: inline-block;
            background: linear-gradient(90deg,#ff9b9b,#ff6b81);
            color: #111;
            font-size: 11px;
            font-weight: 700;
            padding: 6px 16px;
            border-radius: 20px;
            letter-spacing: 2px;
            margin-bottom: 20px;
        }

        .movie-left h1 {
            font-size: 64px;
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 20px;
        }

        .movie-meta {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 7px;
            font-size: 13px;
            color: #aaa;
        }

        .meta-item .icon {
            color: #ff9b9b;
        }

        .movie-desc {
            color: #bbb;
            line-height: 1.9;
            max-width: 580px;
            margin-bottom: 35px;
            font-size: 14px;
        }

        /* ── EPISODE SELECTOR (khusus Series) ── */

        .episode-selector {
            margin-bottom: 35px;
            display: none; /* tampil via JS kalau series */
        }

        .episode-selector.visible {
            display: block;
        }

        .episode-selector h3 {
            font-size: 14px;
            letter-spacing: 2px;
            color: #888;
            margin-bottom: 15px;
        }

        .episode-tabs {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .ep-btn {
            padding: 8px 18px;
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.1);
            background: rgba(255,255,255,0.05);
            color: #ccc;
            font-size: 13px;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            transition: 0.3s;
        }

        .ep-btn:hover,
        .ep-btn.active {
            background: linear-gradient(90deg,#ff9b9b,#ff6b81);
            color: #111;
            font-weight: 600;
            border-color: transparent;
        }

        /* ── RESUME INFO ── */

        .resume-info {
            display: none;
            background: rgba(255,155,155,0.1);
            border: 1px solid rgba(255,155,155,0.2);
            border-radius: 14px;
            padding: 14px 20px;
            margin-bottom: 25px;
            font-size: 13px;
            color: #ff9b9b;
            gap: 10px;
            align-items: center;
        }

        .resume-info.visible {
            display: flex;
        }

        /* ── PLAYER BOX ── */

        .video-box {
            background: rgba(255,255,255,0.04);
            border-radius: 24px;
            padding: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.06);
            box-shadow: 0 0 40px rgba(255,0,90,0.15);
            margin-bottom: 30px;
        }

        /* Layar simulasi */
        .video-screen {
            width: 100%;
            height: 220px;
            border-radius: 16px;
            background: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 18px;
            position: relative;
            overflow: hidden;
        }

        .video-screen img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.5;
        }

        .play-center {
            position: absolute;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: rgba(255,155,155,0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            color: #111;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 0 25px rgba(255,155,155,0.5);
        }

        .play-center:hover {
            transform: scale(1.1);
        }

        /* Progress bar */
        .progress-wrapper {
            margin-bottom: 12px;
        }

        .time-display {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #888;
            margin-bottom: 8px;
        }

        .progress-track {
            width: 100%;
            height: 6px;
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #ff9b9b, #ff6b81);
            border-radius: 10px;
            transition: width 1s linear;
        }

        /* Tombol kontrol */
        .controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .ctrl-btn {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            border: 1px solid rgba(255,255,255,0.1);
            background: rgba(255,255,255,0.05);
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .ctrl-btn:hover {
            background: rgba(255,155,155,0.15);
            border-color: #ff9b9b;
        }

        .ctrl-btn.main {
            width: 64px;
            height: 64px;
            font-size: 24px;
            background: linear-gradient(135deg,#ff9b9b,#ff6b81);
            color: #111;
            border: none;
            box-shadow: 0 0 20px rgba(255,107,129,0.4);
        }

        .ctrl-btn.main:hover {
            transform: scale(1.08);
            box-shadow: 0 0 30px rgba(255,107,129,0.7);
        }

        /* Status bar */
        .status-bar {
            text-align: center;
            font-size: 12px;
            color: #555;
            margin-top: 15px;
            letter-spacing: 1px;
        }

        /* ── ACTION BUTTONS ── */

        .action-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .watch-btn {
            padding: 18px 40px;
            border: none;
            border-radius: 40px;
            background: linear-gradient(90deg,#ff9b9b,#ff6b81);
            color: #111;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            box-shadow: 0 0 20px rgba(255,107,129,0.5);
            transition: 0.3s;
        }

        .watch-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 0 35px rgba(255,107,129,0.8);
        }

        .fav-btn {
            padding: 18px 35px;
            border: none;
            border-radius: 40px;
            background: rgba(255,255,255,0.08);
            color: white;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            transition: 0.3s;
            border: 1px solid rgba(255,255,255,0.1);
        }

        .fav-btn:hover {
            background: rgba(255,255,255,0.14);
        }

        /* ── REKOMENDASI BAWAH ── */

        .recommend-section {
            padding: 60px 80px 80px;
        }

        .section-title {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .section-subtitle {
            color: #777;
            font-size: 13px;
            letter-spacing: 2px;
            margin-bottom: 35px;
        }

        .movie-row {
            display: flex;
            gap: 25px;
            overflow-x: auto;
            padding-bottom: 10px;
        }

        .movie-row::-webkit-scrollbar { display: none; }

        .rec-card {
            min-width: 180px;
            border-radius: 18px;
            overflow: hidden;
            transition: 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }

        .rec-card:hover {
            transform: translateY(-8px);
        }

        .rec-card img {
            width: 100%;
            height: 260px;
            object-fit: cover;
        }

        .rec-card-info {
            padding: 12px;
            background: #0b1024;
        }

        .rec-card-info h4 {
            font-size: 13px;
            margin-bottom: 4px;
        }

        .rec-card-info p {
            color: #888;
            font-size: 11px;
        }

    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <a href="Dashboard.jsp" class="logo">CineStream</a>
        <div class="nav-links">
            <a href="Dashboard.jsp">Home</a>
            <a href="#">Movies</a>
            <a href="#">Series</a>
            <a href="#">Favorites</a>
            <a href="#">My List</a>
            <a href="recommendation.jsp">Recommendations</a>
        </div>
        <div class="profile"></div>
    </div>

    <%
        Konten konten = (Konten) request.getAttribute("konten");
        int progressTerakhir = 0;
        Object progAttr = request.getAttribute("progressTerakhir");
        if (progAttr != null)
            progressTerakhir = (Integer) progAttr;

        String judulFilm    = "Unknown Title";
        String genreFilm    = "Unknown";
        String deskripsiFilm = "No description available.";
        String posterPath   = "";
        int durasiTotal     = 120; // default menit
        boolean isSeries    = false;
        int totalEpisode    = 0;

        if (konten != null) {
            judulFilm    = konten.getJudul();
            genreFilm    = konten.getGenre();
            deskripsiFilm = konten.getDeskripsi();
            durasiTotal  = konten.getDurasi();
            if (konten instanceof Series) {
                isSeries     = true;
                totalEpisode = ((Series) konten).getTotalEpisode();
            }
        }

        int durasiDetik    = durasiTotal * 60;
        int progressPersen = (durasiDetik > 0)
            ? (progressTerakhir * 100 / durasiDetik) : 0;
        int menitTerakhir  = progressTerakhir / 60;
    %>

    <!-- HERO PLAYER -->
    <div class="player-hero">

        <div class="hero-bg"
             style="background-image: url('images/<%= posterPath %>')">
        </div>
        <div class="hero-overlay"></div>

        <div class="player-content">

            <!-- KIRI: Info Film -->
            <div class="movie-left">

                <div class="badge">
                    <%= isSeries ? "SERIES" : "FILM" %>
                </div>

                <h1><%= judulFilm %></h1>

                <div class="movie-meta">
                    <div class="meta-item">
                        <span class="icon">🎬</span>
                        <span><%= genreFilm %></span>
                    </div>
                    <div class="meta-item">
                        <span class="icon">⏱</span>
                        <span>
                            <%= isSeries
                                ? totalEpisode + " Episodes"
                                : (durasiTotal/60) + "h " + (durasiTotal%60) + "m" %>
                        </span>
                    </div>
                </div>

                <p class="movie-desc"><%= deskripsiFilm %></p>

                <!-- Resume info -->
                <div class="resume-info <%= menitTerakhir > 0 ? "visible" : "" %>">
                    ▶ &nbsp; Melanjutkan dari menit ke-<strong><%= menitTerakhir %></strong>
                </div>

                <!-- Episode selector (khusus series) -->
                <div class="episode-selector <%= isSeries ? "visible" : "" %>">
                    <h3>PILIH EPISODE</h3>
                    <div class="episode-tabs">
                        <%
                            if (isSeries) {
                                for (int ep = 1; ep <= Math.min(totalEpisode, 12); ep++) {
                        %>
                        <button class="ep-btn <%= ep == 1 ? "active" : "" %>"
                                onclick="pilihEpisode(<%= ep %>, this)">
                            EP <%= ep %>
                        </button>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>

                <div class="action-buttons">
                    <button class="watch-btn"
                            onclick="mulaiTonton()">
                        ▶ &nbsp;
                        <%= menitTerakhir > 0 ? "Lanjutkan" : "Tonton Sekarang" %>
                    </button>
                    <button class="fav-btn">♡ &nbsp; Tambah Favorit</button>
                </div>

            </div>

            <!-- KANAN: Video Player -->
            <div class="movie-right">

                <div class="video-box">

                    <!-- Layar simulasi -->
                    <div class="video-screen">
                        <img src="images/<%= posterPath %>"
                             alt="<%= judulFilm %>"
                             onerror="this.src='https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=600&auto=format&fit=crop'">
                        <div class="play-center" onclick="togglePlay()" id="playCenterBtn">
                            ▶
                        </div>
                    </div>

                    <!-- Progress bar -->
                    <div class="progress-wrapper">
                        <div class="time-display">
                            <span id="waktuSekarang">
                                <%= String.format("%02d:%02d",
                                    progressTerakhir/60,
                                    progressTerakhir%60) %>
                            </span>
                            <span id="waktuTotal">
                                <%= String.format("%02d:%02d",
                                    durasiTotal, 0) %>
                            </span>
                        </div>
                        <div class="progress-track"
                             onclick="seekProgress(event)">
                            <div class="progress-fill"
                                 id="progressFill"
                                 style="width:<%= progressPersen %>%">
                            </div>
                        </div>
                    </div>

                    <!-- Kontrol -->
                    <div class="controls">
                        <button class="ctrl-btn" onclick="rewind()">⏪</button>
                        <button class="ctrl-btn main"
                                id="playPauseBtn"
                                onclick="togglePlay()">▶</button>
                        <button class="ctrl-btn" onclick="forward()">⏩</button>
                    </div>

                    <div class="status-bar" id="statusBar">
                        READY TO PLAY
                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- REKOMENDASI -->
    <div class="recommend-section">
        <h2 class="section-title">You Might Also Like</h2>
        <p class="section-subtitle">BASED ON WHAT YOU'RE WATCHING</p>

        <div class="movie-row">
            <a href="#" class="rec-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/f/f7/Stranger_Things_season_4.jpg">
                <div class="rec-card-info">
                    <h4>Stranger Things</h4>
                    <p>Horror • Series</p>
                </div>
            </a>
            <a href="#" class="rec-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/8/87/The_Lord_of_the_Rings_-_The_Two_Towers.jpg">
                <div class="rec-card-info">
                    <h4>Lord of The Rings</h4>
                    <p>Fantasy • 3h 45m</p>
                </div>
            </a>
            <a href="#" class="rec-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/b/bd/Doctor_Strange_in_the_Multiverse_of_Madness_poster.jpg">
                <div class="rec-card-info">
                    <h4>Doctor Strange</h4>
                    <p>Action • 2h 05m</p>
                </div>
            </a>
            <a href="#" class="rec-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/0/05/Frozen_%282013_film%29_poster.jpg">
                <div class="rec-card-info">
                    <h4>Frozen</h4>
                    <p>Fantasy • 1h 52m</p>
                </div>
            </a>
            <a href="#" class="rec-card">
                <img src="https://upload.wikimedia.org/wikipedia/en/9/9e/WandaVision_poster.jpg">
                <div class="rec-card-info">
                    <h4>WandaVision</h4>
                    <p>Adventure • Series</p>
                </div>
            </a>
        </div>
    </div>

    <!-- JAVASCRIPT PLAYER -->
    <script>
        // ── State player ──
        let isPlaying    = false;
        let currentDetik = <%= progressTerakhir %>;
        let totalDetik   = <%= durasiDetik %>;
        let timerPlayer  = null;
        let timerAutoSave = null;
        const kontenId   = <%= konten != null ? konten.getId() : 0 %>;

        // ── Tombol Play/Pause ──
        function togglePlay() {
            if (isPlaying) {
                pause();
            } else {
                play();
            }
        }

        function play() {
            isPlaying = true;
            document.getElementById('playPauseBtn').textContent = '⏸';
            document.getElementById('playCenterBtn').textContent = '⏸';
            document.getElementById('statusBar').textContent = 'NOW PLAYING';

            // Simulasi progress tiap detik
            timerPlayer = setInterval(() => {
                if (currentDetik < totalDetik) {
                    currentDetik++;
                    updateUI();
                } else {
                    selesai();
                }
            }, 1000);

            // Auto-save tiap 10 detik
            timerAutoSave = setInterval(() => {
                simpanProgress();
            }, 10000);
        }

        function pause() {
            isPlaying = false;
            clearInterval(timerPlayer);
            clearInterval(timerAutoSave);
            document.getElementById('playPauseBtn').textContent = '▶';
            document.getElementById('playCenterBtn').textContent = '▶';
            document.getElementById('statusBar').textContent = 'PAUSED';
            simpanProgress(); // save saat pause
        }

        function rewind() {
            currentDetik = Math.max(0, currentDetik - 10);
            updateUI();
        }

        function forward() {
            currentDetik = Math.min(totalDetik, currentDetik + 10);
            updateUI();
        }

        function mulaiTonton() {
            document.querySelector('.video-box')
                .scrollIntoView({ behavior: 'smooth' });
            if (!isPlaying) play();
        }

        function pilihEpisode(ep, btn) {
            document.querySelectorAll('.ep-btn')
                .forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            currentDetik = 0;
            updateUI();
            if (isPlaying) {
                pause();
                play();
            }
        }

        function seekProgress(e) {
            const track = e.currentTarget;
            const rect  = track.getBoundingClientRect();
            const pct   = (e.clientX - rect.left) / rect.width;
            currentDetik = Math.floor(pct * totalDetik);
            updateUI();
        }

        function selesai() {
            pause();
            document.getElementById('statusBar')
                .textContent = '✓ SELESAI DITONTON';
            simpanProgress(true);
        }

        // ── Update tampilan progress ──
        function updateUI() {
            const pct = totalDetik > 0
                ? (currentDetik / totalDetik * 100) : 0;
            document.getElementById('progressFill')
                .style.width = pct + '%';
            document.getElementById('waktuSekarang')
                .textContent = formatWaktu(currentDetik);
        }

        function formatWaktu(detik) {
            const m = Math.floor(detik / 60)
                .toString().padStart(2, '0');
            const s = (detik % 60)
                .toString().padStart(2, '0');
            return m + ':' + s;
        }

        // ── Kirim progress ke server ──
        function simpanProgress(selesai = false) {
            const formData = new FormData();
            formData.append('kontenId', kontenId);
            formData.append('detik', currentDetik);
            formData.append('totalDurasi', totalDetik);
            formData.append('selesai', selesai);

            fetch('${pageContext.request.contextPath}/player', {
                method: 'POST',
                body: formData
            }).catch(err => console.log('Auto-save:', err));
        }

        // ── Save saat user tutup/pindah halaman ──
        window.addEventListener('beforeunload', () => {
            if (isPlaying || currentDetik > 0) {
                simpanProgress();
            }
        });
    </script>

</body>
</html>
