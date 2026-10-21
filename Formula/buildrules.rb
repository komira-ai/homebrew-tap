class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.14/buildrules-cli-0.0.14-macos-arm64.tar.gz"
      sha256 "d7b74f7f15d3bc06f8e1b388a448990ea2856275301b9f55106d430770bb05cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.14/buildrules-cli-0.0.14-linux-aarch64.tar.gz"
      sha256 "ce60dc70357c9b79c2f8f6e688d2286c8abf9ebef5806e1f086f20dca6588868"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.14/buildrules-cli-0.0.14-linux-x86_64.tar.gz"
      sha256 "26bb9dc5fbfefc19f1206d491d67ba70008a528c84ec0178a8bb1c38f28802c9"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
