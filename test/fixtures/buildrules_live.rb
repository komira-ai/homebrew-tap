class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.8/buildrules-cli-0.0.8-macos-arm64.tar.gz"
      sha256 "21b35d055998df882b78d7643967ebf13120c306d4eda704e8410042cfcb9dd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.8/buildrules-cli-0.0.8-linux-aarch64.tar.gz"
      sha256 "b0afe98148dc6bb29cb47948b980fa7f91f27f8fad971e7bf2514df4f36d21db"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.8/buildrules-cli-0.0.8-linux-x86_64.tar.gz"
      sha256 "e5834c0f17f305b062e479bc309cb868d83f9901e5bcd17b8b84b0a39ab69ab7"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
