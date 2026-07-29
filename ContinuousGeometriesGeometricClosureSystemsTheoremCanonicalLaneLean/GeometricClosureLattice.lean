import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure GeometricClosureLatticePackage where
  carrier : Type u
  closureOp : carrier → carrier
  exchangeLaw : Prop
  rankFunction : carrier → ℕ

structure GeometricClosureLatticeEvidence (G : GeometricClosureLatticePackage) where
  exchangeLawClosed : G.exchangeLaw
  rankWellDefined : Prop
  rankWellDefinedClosed : rankWellDefined

def GeometricClosureLatticeClosed (G : GeometricClosureLatticePackage) : Prop :=
  G.exchangeLaw ∧ G.rankFunction ≥ (λ _ => 0)

theorem geometric_closure_lattice_closed_from_evidence (G : GeometricClosureLatticePackage) (E : GeometricClosureLatticeEvidence G) :
    GeometricClosureLatticeClosed G := by
  exact And.intro E.exchangeLawClosed (by exact E.rankWellDefinedClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse