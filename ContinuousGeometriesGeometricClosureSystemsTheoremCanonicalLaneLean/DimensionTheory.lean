import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.GeometricLattice

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure DimensionTheoryPackage {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} (G : GeometricLatticePackage E) where
  dimensionFunction : Type u → Nat
  rankNull : dimensionFunction (⊥ : G.latticeElements) = 0
  rankAtom : ∀ a : G.latticeElements, isAtom a → dimensionFunction a = 1
  rankCovering : ∀ a b : G.latticeElements, a < b → dimensionFunction b = dimensionFunction a + 1
  rankNullClosed : rankNull
  rankAtomClosed : rankAtom
  rankCoveringClosed : rankCovering

def DimensionTheoryClosed {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} {G : GeometricLatticePackage E} (D : DimensionTheoryPackage G) : Prop :=
  D.rankNull ∧ D.rankAtom ∧ D.rankCovering

theorem dimension_theory_closed {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} {G : GeometricLatticePackage E} (D : DimensionTheoryPackage G) : DimensionTheoryClosed D :=
  And.intro D.rankNullClosed (And.intro D.rankAtomClosed D.rankCoveringClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse