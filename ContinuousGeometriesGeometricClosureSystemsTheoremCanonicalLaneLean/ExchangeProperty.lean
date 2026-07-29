import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ExchangePropertyPackage (C : ContinuousGeometryClosurePackage) where
  exchangeAxiom : Prop
  appliesToClosure : ∀ a b x, a ∉ closureOperator {b} → a ∈ closureOperator ({b} ∪ {x}) → x ∈ closureOperator ({a} ∪ {b})
  exchangeAxiomClosed : exchangeAxiom
  appliesToClosureClosed : appliesToClosure

def ExchangePropertyClosed {C : ContinuousGeometryClosurePackage} (E : ExchangePropertyPackage C) : Prop :=
  E.exchangeAxiom ∧ E.appliesToClosure

theorem exchange_property_closed {C : ContinuousGeometryClosurePackage} (E : ExchangePropertyPackage C) : ExchangePropertyClosed E :=
  And.intro E.exchangeAxiomClosed E.appliesToClosureClosed

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse