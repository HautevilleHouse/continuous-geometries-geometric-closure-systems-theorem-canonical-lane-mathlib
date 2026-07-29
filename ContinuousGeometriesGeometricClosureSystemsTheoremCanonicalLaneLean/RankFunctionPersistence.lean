import ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ContinuousGeometriesClosurePackage

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure RankFunctionPersistencePackage (A : AdmissibleClass) where
  rankFunction : ContinuousGeometryObject → ℝ
  continuityUnderClosure : Prop
  rankValueForComplement : Prop
  rankMonotonicity : Prop
  continuityUnderClosureClosed : continuityUnderClosure
  rankValueForComplementClosed : rankValueForComplement
  rankMonotonicityClosed : rankMonotonicity

structure RankFunctionPersistenceEvidence (A : AdmissibleClass) (R : RankFunctionPersistencePackage A) where
  continuityUnderClosureClosed : R.continuityUnderClosure
  rankValueForComplementClosed : R.rankValueForComplement
  rankMonotonicityClosed : R.rankMonotonicity

def RankFunctionPersistenceClosed (A : AdmissibleClass) (R : RankFunctionPersistencePackage A) : Prop :=
  R.continuityUnderClosure ∧ R.rankValueForComplement ∧ R.rankMonotonicity

theorem rank_function_persistence_closed_from_evidence
  (A : AdmissibleClass) (R : RankFunctionPersistencePackage A)
  (E : RankFunctionPersistenceEvidence A R) : RankFunctionPersistenceClosed A R :=
by
  exact And.intro E.continuityUnderClosureClosed
    (And.intro E.rankValueForComplementClosed E.rankMonotonicityClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse