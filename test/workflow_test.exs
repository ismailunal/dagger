defmodule WorkflowText do
  use ExUnit.Case
  alias Dagger.{Workflow, Rule, Step, Pipeline}
  alias Dagger.TestRunner

  describe "workflows" do

    test "a workflow reacts to pure facts as inputs" do
      rule1 = Rule.new(
        name: "a test rule",
        condition: fn :fact_1 -> true end, # condition is a function which matches on a fact and returns a boolean
        description: "Given fact 1 occuring this rule reacts to fact 1",
        reaction: fn :fact_1 -> :reacting_to_fact_1, # a function that is given the activation condition/facts of the rule or just an arbitrary term.
      )

      rule2 = Rule.new(
        name: "a test rule",
        condition: fn :fact_2 -> true end, # condition is a function which matches on a fact and returns a boolean
        description: "Given fact 2 occuring this rule reacts to fact 2",
        reaction: fn :fact_2 -> :reacting_to_fact_2, # a function that is given the activation condition/facts of the rule or just an arbitrary term.
      )

      workflow =
        Workflow.new("testworkflow", fn :test_event -> true end)
        |> Workflow.add_rule(rule1)
        |> Workflow.add_rule(rule2)

      assert {:ok, :reacting_to_fact_1, workflow} == Workflow.react(:fact_1)
      assert {:ok, :reacting_to_fact_2, workflow} == Workflow.react(:fact_2)
    end

    test "a workflow compiles rules into a graph of dependent steps" do

    end
  end

  describe "rule constructor constraints" do
    test "a rule needs required params to be created" do

    end

    test "conditions must be functions" do

    end

    test "a rule's condition must return a boolean" do

    end

    test "a rule's reaction " do

    end

  end

  describe "use cases" do
    test "approval procedure" do

    end

    test "coffee shop fsm" do

    end

    test "text processing pipeline" do

    end

    test "" do

    end
  end

end