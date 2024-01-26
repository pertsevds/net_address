defmodule NetAddress.MixProject do
  use Mix.Project

  def project do
    [
      app: :net_address,
      version: "0.3.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.cobertura": :test
      ],
      package: [
        description: "IP address and Mac address tools",
        licenses: ["MIT"],
        files: ~w(lib mix.exs README* LICENSE* VERSIONS*),
        links: %{"GitHub" => "https://github.com/ityonemo/net_address"}
      ],
      docs: [
        source_url: "https://github.com/ityonemo/net_address"
      ]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  # static analysis tools
  # docs dependencies
  # testing
  defp deps,
    do: [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:styler, "~> 0.11", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:stream_data, "~> 0.5", only: :test}
    ]
end
