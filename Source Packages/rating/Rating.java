/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rating;

/**
 *
 * @author ACER
 */
public class Rating {

    private int idRating;
    private int idUser;
    private int idKonten;
    private double nilai;

    public Rating() {
    }

    public Rating(int idRating, int idUser, int idKonten, double nilai) {
        this.idRating = idRating;
        this.idUser = idUser;
        this.idKonten = idKonten;
        this.nilai = nilai;
    }

    public int getIdRating() {
        return idRating;
    }

    public void setIdRating(int idRating) {
        this.idRating = idRating;
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

    public double getNilai() {
        return nilai;
    }

    public void setNilai(double nilai) {
        this.nilai = nilai;
    }
}
