/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class Film extends Konten {

    private String sutradara;

    public Film(int id, String judul, String genre,
                String deskripsi, int durasi,
                String sutradara) {

        super(id, judul, genre, deskripsi, durasi);
        this.sutradara = sutradara;
    }

    public String getSutradara() {
        return sutradara;
    }

    @Override
    public void tampilDetail() {
        System.out.println("Film : " + judul);
        System.out.println("Genre : " + genre);
    }
}