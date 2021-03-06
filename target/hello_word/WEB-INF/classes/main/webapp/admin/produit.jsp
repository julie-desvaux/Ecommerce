<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="headerFooter/header.jsp"%>

<!-- FORMULAIRE AJOUT PRODUIT-->
<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">Entrée des produits</h3>
          </div>
          <div class="container-fluid">
            <div class="flex-column">
              <form method="post" action="/admin/produit" class="form" style="margin:50px;">
                <div class="form-group">
                  <label>Marque</label>
                  <input type="text" name="marque" class="form-control input-lg" placeholder="Merci d'entrer la marque du produit">
                </div>
                <div class="form-group">
                  <label>Nom</label>
                  <input type="text" name="name" class="form-control input-lg" placeholder="Merci d'entrer le nom du produit">
                </div>
                <div class="form-group">
                  <label>Mini Description</label>
                  <textarea name="mini_desc" class="form-control input-lg" placeholder="Merci d'entrer une brève description"></textarea>
                </div>
                <div class="form-group">
                  <label>Description</label>
                  <textarea class="form-control" name="description" placeholder="Merci d'entrer la description complète du produit"></textarea>
                </div>
                <div class="form-group">
                  <label>Prix</label>
                  <input class="form-control" type="number" step=".01" name="prix" placeholder="Merci d'entrer le prix du produit"></input>
                </div>
                <div class="form-group">
                  <label>Promo</label>
                  <input class="form-control" type="number" name="promo" placeholder="Merci d'entrer la % de promo ou 0 si pas de promo"></input>
                </div>
                <div class="form-group">
                  <label>Url Photo</label>
                  <input class="form-control" name="url_photo" placeholder="Merci d'entrer l'url de l'image du produit"></input>
                </div>
                <div class="form-group">
                  <label>Quantité disponible</label>
                  <input class="form-control" type="number" name="quantite" placeholder="Merci d'entrer la quantité de stock du produit"></input>
                </div>
                <div class="form-select">
                  <label>Catégorie</label>
                  <select name="idCategorie">
                    <c:forEach items="${ listeCategorie }" var="categorie">
                      <option value="${categorie.getId()}">${categorie.getNom()}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group">
                  <label></label>
                  <div class="custom-control custom-radio">
                    <label><input type="radio" name="isActif" value="true" checked>En vente</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <label><input type="radio" name="isActif" value="false">Désactivé</label>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary">Ajout Produit</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- FIN FORMULAIRE AJOUT PRODUIT-->

<!-- DEBUT AFFICHAGE PRODUIT-->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="card card-primary card-outline">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Affichage des produits</h3>
            </div>
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Catégorie</th>
                  <th>Marque</th>
                  <th>Nom du Produit</th>
                  <th>Photo</th>
                  <th>Prix</th>
                  <th>Promo</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ listeProduit }" var="produit">
                  <tr>
                    <td>${produit.getCategorie().getNom()}</td>
                    <td>${produit.getMarque()}</td>
                    <td><a href="/admin/detail_produit?id=${produit.getId()}">${produit.getNom()}</a></td>
                    <td><a href="/admin/detail_produit?id=${produit.getId()}"><img class="imgDashBoardProd" src="${produit.getUrl_photo()}"></a></td>
                    <td>${produit.getPrix()}</td>
                    <td>${produit.getPromo()} %</td>
                  </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th>Catégorie</th>
                  <th>Marque</th>
                  <th>Nom du Produit</th>
                  <th>Photo</th>
                  <th>Prix</th>
                  <th>Promo</th>
                </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- FIN AFFICHAGE PRODUIT-->

<!-- DataTables -->


<%@ include file="headerFooter/footer.jsp"%>