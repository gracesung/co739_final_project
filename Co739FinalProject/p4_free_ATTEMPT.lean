-- import Mathlib.Topology.Basic

-- #check TopologicalSpace

-- import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Combinatorics.SimpleGraph.Subgraph
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.Fintype.Card

#check SimpleGraph
#check SimpleGraph.singletonSubgraph
#check SimpleGraph.Subgraph


--  prove: P4 free graphs structure theorem


#check SimpleGraph.Subgraph.IsInduced
-- #check SimpleGraph.Subgraphx

-- def p4 (G: SimpleGraph α) :=
--   -- ∃(v1 v2 v3 v4 : α)
--   G.edgeSet

def isP4 (G : SimpleGraph α) :=
  ∃ (v1 v2 v3 v4 : α),
  G.Adj v1 v2 ∧  G.Adj v2 v3 ∧  G.Adj v3 v4
  ∧ ¬ (G.Adj v1 v3) ∧ ¬ (G.Adj v1 v4) ∧ ¬ (G.Adj v2 v4)
    -- (v1, v2) ∈ G.edgeSet ∧
    -- (v2, v3) ∈ G.edgeSet ∧
    -- (v3, v4) ∈ G.edgeSet ∧
    -- ¬ ((v1, v3) ∈ G.edgeSet) ∧
    -- ¬ ((v2, v4) ∈ G.edgeSet) ∧
    -- ¬ ((v1, v4) ∈ G.edgeSet)

#check isP4

def isP4Free (G: SimpleGraph α ) :=
  ¬ (isP4 G)

-- theorem p4_free {α : Type*} [DecidableEq α] (G : SimpleGraph α) :
--   (isP4 G ↔
--     ∀ (H : SimpleGraph.Subgraph G),
--       (SimpleGraph.Subgraph.IsInduced H  →
--         (H.verts.toFinset_card = 1 ∨
--          ∃ (A B : Finset α),
--            H.verts = A ∪ B ∧
--            (A.card > 0 ∧ B.card > 0) ∧
--            (A.completeOrAnticompleteTo B)) )) := by
--            sorry
-- begin
--   -- The proof will go here.
-- end
