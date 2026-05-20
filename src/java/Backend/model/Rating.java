/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Backend.model;

/**
 *
 * @author ACER
 */
public class Rating {

    private int nilaiRating;

    public Rating(int nilaiRating) {
        this.nilaiRating = nilaiRating;
    }

    public int getNilaiRating() {
        return nilaiRating;
    }

    public void beriRating() {
        System.out.println("Rating diberikan");
    }
}