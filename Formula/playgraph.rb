class Playgraph < Formula
  desc "Interactive math animation viewer powered by markdown"
  homepage "https://github.com/leaf-kit/playgraph.md"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build
  depends_on "node" => :build

  url "https://github.com/leaf-kit/playgraph.md/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6884ec3a175b449dd95b6dc25f6e7091baed38b152cb5d2c372fc0fb69ebc393"

  def install
    system "npm", "install"
    cd "src-tauri" do
      system "cargo", "build", "--release"
      bin.install "target/release/playgraph"
    end
  end

  test do
    assert_match "playgraph", shell_output("#{bin}/playgraph --version")
  end
end
