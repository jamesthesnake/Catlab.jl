using ..GAT

""" Doctrine of *bicategory of relations*

Reference: (Carboni & Walters, 1987, "Cartesian bicategories I")
"""
@signature SymmetricMonoidalCategory(Ob,Hom) => BicategoryRelations(Ob,Hom) begin
  # Dagger category.
  dagger(f::Hom(A,B))::Hom(B,A) <= (A::Ob,B::Ob)
  
  # Self-dual compact closed category.
  ev(A::Ob)::Hom(otimes(A,A), munit())
  coev(A::Ob)::Hom(munit(), otimes(A,A))
  
  # Diagonal and codiagonal.
  mcopy(A::Ob)::Hom(A,otimes(A,A))
  delete(A::Ob)::Hom(A,munit())
  mmerge(A::Ob)::Hom(otimes(A,A),A)
  create(A::Ob)::Hom(munit(),A)
  
  # Unicode syntax
  ∇(A::Ob) = mmerge(A)
  ◇(A::Ob) = delete(A)
  Δ(A::Ob) = mcopy(A)
  □(A::Ob) = create(A)
end