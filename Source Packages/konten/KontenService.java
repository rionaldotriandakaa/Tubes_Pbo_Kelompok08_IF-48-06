/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package konten;

import java.util.List;
/**
 *
 * @author ACER
 */
public class KontenService {

    private KontenRepository repository;

    public KontenService() {
        repository = new KontenRepository();
    }

    public List<Konten> getAllKonten() {
        return repository.getAllKonten();
    }
}
