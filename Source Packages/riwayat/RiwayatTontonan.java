/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package riwayat;

import java.sql.Timestamp;
/**
 *
 * @author ACER
 */
public class RiwayatTontonan {

    private int idRiwayat;
    private int idUser;
    private int idKonten;
    private Timestamp tanggalTonton;
    
    private String judulKonten;
    private String posterKonten;
    private String genre;
    private int durasi;
    private Integer episodeId;
    
    public RiwayatTontonan() {
    }

    public int getIdRiwayat() {
        return idRiwayat;
    }

    public void setIdRiwayat(int idRiwayat) {
        this.idRiwayat = idRiwayat;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdKonten() {
        return idKonten;
    }

    public void setIdKonten(int idKonten) {
        this.idKonten = idKonten;
    }

    public Timestamp getTanggalTonton() {
        return tanggalTonton;
    }

    public void setTanggalTonton(Timestamp tanggalTonton) {
        this.tanggalTonton = tanggalTonton;
    }
    
    public String getJudulKonten() {
    return judulKonten;
    }

    public void setJudulKonten(String judulKonten) {
        this.judulKonten = judulKonten;
    }

    public String getPosterKonten() {
        return posterKonten;
    }

    public void setPosterKonten(String posterKonten) {
        this.posterKonten = posterKonten;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getDurasi() {
        return durasi;
    }

    public void setDurasi(int durasi) {
        this.durasi = durasi;
    }
    
    public Integer getEpisodeId() {
    return episodeId;
}

public void setEpisodeId(Integer episodeId) {
    this.episodeId = episodeId;
}
}