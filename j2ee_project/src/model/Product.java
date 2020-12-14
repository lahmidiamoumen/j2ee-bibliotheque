package model;

public class Product {
    private String libelle;
    private String photo;
    private String prix;
    private String qte;

    public Product(String libelle, String photo, String prix, String qte) {
        this.libelle = libelle;
        this.photo = photo;
        this.prix = prix;
        this.qte = qte;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPrix() {
        return prix;
    }

    public void setPrix(String prix) {
        this.prix = prix;
    }

    public String getQte() {
        return qte;
    }

    public void setQte(String qte) {
        this.qte = qte;
    }

    public void ajouterProduit(String libelle, String photo, String prix, String qte) {
        this.libelle = libelle;
        this.photo = photo;
        this.prix = prix;
        this.qte = qte;
    }
}