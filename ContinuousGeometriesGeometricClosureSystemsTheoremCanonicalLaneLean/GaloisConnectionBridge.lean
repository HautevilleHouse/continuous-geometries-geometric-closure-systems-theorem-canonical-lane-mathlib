import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ContinuousGeometryClosure

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure GaloisConnection {A B : Type u} (f : A → B) (g : B → A) where
  adjunction : ∀ a b, f a ≤ b ↔ a ≤ g b

structure GaloisInsertion {A B : Type u} (f : A → B) (g : B → A) extends GaloisConnection f g where
  closure : ∀ b, f (g b) ≤ b

theorem galois_insertion_yields_closure {A B : Type u} [PartialOrder A] [PartialOrder B]
    (f : A → B) (g : B → A) (gi : GaloisInsertion f g) :
    ∀ b, f (g (f (g b))) = f (g b) :=
  λ b => le_antisymm (gi.closure (f (g b))) (gi.toGaloisConnection.adjunction.mpr (le_refl _))

def GaloisClosureClosed {A B : Type u} (f : A → B) (g : B → A) (gi : GaloisInsertion f g) : Prop :=
  ∀ b, f (g (f (g b))) = f (g b)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse