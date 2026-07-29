import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.DimensionTheory

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ProjectiveGeometryPackage {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} {G : GeometricLatticePackage E} (D : DimensionTheoryPackage G) where
  collinearity : G.latticeElements → G.latticeElements → Prop
  desarguesProperty : Prop
  pappusProperty : Prop
  collinearityDefined : collinearity = λ p q r => dimensionFunction (p ∧ q ∨ r) = 2
  desarguesPropertyClosed : desarguesProperty
  pappusPropertyClosed : pappusProperty

def ProjectiveGeometryClosed {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} {G : GeometricLatticePackage E} {D : DimensionTheoryPackage G} (P : ProjectiveGeometryPackage D) : Prop :=
  P.desarguesProperty ∧ P.pappusProperty

theorem projective_geometry_closed {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} {G : GeometricLatticePackage E} {D : DimensionTheoryPackage G} (P : ProjectiveGeometryPackage D) : ProjectiveGeometryClosed P :=
  And.intro P.desarguesPropertyClosed P.pappusPropertyClosed

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse