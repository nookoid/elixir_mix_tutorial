defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the 'bucket' by 'key'.
  &Map.get(&1, key) == fn(map) -> Map.get(map, key)
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the 'value' for the given 'key' in the 'bucket'.
  &Map.put(&1, key, value) == fn(map) -> Map.put(map, key, value)
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes 'key' from 'bucket'.any()

  Returns the current value of 'key', if 'key' exists.

  &Map.pop(&1, key) == fn(bucket) -> Map.pop(bucket, key)
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end

end
