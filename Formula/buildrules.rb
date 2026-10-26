class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.45/buildrules-cli-0.0.45-macos-arm64.tar.gz"
      sha256 "7c0a1d0a94fcfcb9f4d3facd5db4f949ee164f00716e71fcb04fbe9918d2937e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.45/buildrules-cli-0.0.45-linux-aarch64.tar.gz"
      sha256 "9624920d02742ee08f03feb7b286891add5ad7f6a7e8b2b788f763c82a0b37cb"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.45/buildrules-cli-0.0.45-linux-x86_64.tar.gz"
      sha256 "f81b10e60f4c543bfbac25779db8d7dc6300cb4e9957ee7c6f738c8671cd1bef"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
