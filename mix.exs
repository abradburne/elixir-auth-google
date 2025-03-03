defmodule ElixirAuthGoogle.MixProject do
  use Mix.Project

  @description "Minimalist Google OAuth Authentication for Elixir Apps"
  @version "1.5.1"

  def project do
    [
      app: :elixir_auth_google,
      version: @version,
      elixir: "~> 1.12.3",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: @description,
      package: package(),
      # coverage
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.json": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8.0"},
      {:jason, "~> 1.2"},

      # tracking test coverage
      {:excoveralls, "~> 0.14.1", only: [:test, :dev]},

      # documentation
      {:ex_doc, "~> 0.25.3", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["dwyl"],
      licenses: ["GNU GPL v2.0"],
      links: %{github: "https://github.com/dwyl/elixir-auth-google"},
      files: ~w(lib LICENSE mix.exs README.md .formatter.exs)
    ]
  end
end
