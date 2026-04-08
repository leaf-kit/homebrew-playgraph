class Playgraph < Formula
  desc "Markdown-powered interactive animation viewer for math, physics, and more"
  homepage "https://github.com/leaf-kit/playgraph.md"
  version "0.1.0"
  license "MIT"

  url "https://github.com/leaf-kit/playgraph.md/releases/download/v0.1.0/playgraph-0.1.0-x86_64-darwin.tar.gz"
  sha256 "afdb2bfb8c8e2f696d327f4c70cd8cf9d0c6180eb6aeace2fac8fa830b128a1b"

  def install
    bin.install "playgraph"
  end

  test do
    assert_match "playgraph", shell_output("#{bin}/playgraph --version")
  end
end
