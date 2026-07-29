import ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ContinuousGeometriesAdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometriesClosurePackage (A : AdmissibleClass) where
  geometry : ContinuousGeometryObject
  closureUnderComplement : Prop
  closureUnderArbitraryMeet : Prop
  closureUnderArbitraryJoin : Prop
  rankContinuityPreserved : Prop
  closureUnderComplementClosed : closureUnderComplement
  closureUnderArbitraryMeetClosed : closureUnderArbitraryMeet
  closureUnderArbitraryJoinClosed : closureUnderArbitraryJoin
  rankContinuityPreservedClosed : rankContinuityPreserved

structure ContinuousGeometriesClosureEvidence (A : AdmissibleClass) (C : ContinuousGeometriesClosurePackage A) where
  closureUnderComplementClosed : C.closureUnderComplement
  closureUnderArbitraryMeetClosed : C.closureUnderArbitraryMeet
  closureUnderArbitraryJoinClosed : C.closureUnderArbitraryJoin
  rankContinuityPreservedClosed : C.rankContinuityPreserved

def ContinuousGeometriesClosureClosed (A : AdmissibleClass) (C : ContinuousGeometriesClosurePackage A) : Prop :=
  C.closureUnderComplement ∧ C.closureUnderArbitraryMeet ∧
  C.closureUnderArbitraryJoin ∧ C.rankContinuityPreserved

theorem continuous_geometries_closure_closed_from_evidence
  (A : AdmissibleClass) (C : ContinuousGeometriesClosurePackage A)
  (E : ContinuousGeometriesClosureEvidence A C) : ContinuousGeometriesClosureClosed A C :=
by
  exact And.intro E.closureUnderComplementClosed
    (And.intro E.closureUnderArbitraryMeetClosed
      (And.intro E.closureUnderArbitraryJoinClosed E.rankContinuityPreservedClosed))

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse