import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ContinuousGeometry

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure EmbeddingClosure (M N : Type u) [TopologicalSpace M] [TopologicalSpace N] where
  source : ContinuousGeometry M
  target : ContinuousGeometry N
  embeddingMap : M → N
  closurePreserving : ∀ s : Set M, target.closureSystem.closureOperator (embeddingMap '' s) =
    embeddingMap '' (source.closureSystem.closureOperator s)
  continuousEmbedding : Prop
  continuousEmbeddingClosed : continuousEmbedding

def EmbeddingClosureClosed (M N : Type u) [TopologicalSpace M] [TopologicalSpace N] (E : EmbeddingClosure M N) : Prop :=
  ContinuousGeometryClosed M E.source ∧ ContinuousGeometryClosed N E.target ∧
  (∀ s : Set M, E.target.closureSystem.closureOperator (E.embeddingMap '' s) =
    E.embeddingMap '' (E.source.closureSystem.closureOperator s)) ∧
  E.continuousEmbedding

theorem embedding_closure_closed_from_fields (M N : Type u) [TopologicalSpace M] [TopologicalSpace N]
    (E : EmbeddingClosure M N) : EmbeddingClosureClosed M N E := by
  refine And.intro (continuous_geometry_closed_from_fields M E.source) ?_
  refine And.intro (continuous_geometry_closed_from_fields N E.target) ?_
  exact And.intro E.closurePreserving E.continuousEmbeddingClosed

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse