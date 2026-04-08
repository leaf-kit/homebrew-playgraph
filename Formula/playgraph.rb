class Playgraph < Formula
  desc "Markdown-powered interactive animation viewer for math, physics, and more"
  homepage "https://github.com/leaf-kit/playgraph.md"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build
  depends_on "node" => :build

  url "https://github.com/leaf-kit/playgraph.md/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8848f04b9a799baecf5675ba35bce5436af9de3ba1bb463900ec860ddaa8bd20"

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
