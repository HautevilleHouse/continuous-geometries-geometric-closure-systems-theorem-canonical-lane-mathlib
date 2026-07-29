import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ExchangeProperty

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure GeometricLatticePackage {C : ContinuousGeometryClosurePackage} (E : ExchangePropertyPackage C) where
  latticeElements : Type u
  meet : latticeElements → latticeElements → latticeElements
  join : latticeElements → latticeElements → latticeElements
  modularLaw : Prop
  continuousJoins : Prop
  modularLawClosed : modularLaw
  continuousJoinsClosed : continuousJoins

def GeometricLatticeClosed {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} (G : GeometricLatticePackage E) : Prop :=
  G.modularLaw ∧ G.continuousJoins

theorem geometric_lattice_closed {C : ContinuousGeometryClosurePackage} {E : ExchangePropertyPackage C} (G : GeometricLatticePackage E) : GeometricLatticeClosed G :=
  And.intro G.modularLawClosed G.continuousJoinsClosed

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse