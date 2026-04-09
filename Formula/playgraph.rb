class Playgraph < Formula
  desc "Markdown-powered interactive animation viewer for math, physics, and more"
  homepage "https://github.com/leaf-kit/playgraph.md"
  url "https://github.com/leaf-kit/playgraph.md/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c43cf03595bff62f2692c0219fb8fa62e3631828e67842ada7b22e7bc063defa"
  license "MIT"
  version "0.2.0"

  depends_on "rust" => :build
  depends_on "node" => :build

  def install
    system "npm", "install"
    cd "src-tauri" do
      system "cargo", "build", "--release"
      bin.install "target/release/playgraph"
    end
    (share/"playgraph/library").install Dir["library/*"]
  end

  test do
    assert_match "playgraph", shell_output("#{bin}/playgraph --version", 1)
  end
end
