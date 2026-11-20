class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.77/buildrules-cli-0.0.77-macos-arm64.tar.gz"
      sha256 "80e4e47d17b04257a1135a7083c7ea8d923c980df34f6a845c74514b64984e5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.77/buildrules-cli-0.0.77-linux-aarch64.tar.gz"
      sha256 "dee9b00ad3c6fafac20c121798c274ce411cc6331dd3c8667cd2322d103863cd"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.77/buildrules-cli-0.0.77-linux-x86_64.tar.gz"
      sha256 "5f020e293e0de8c7452f5c8d98638fb567bf944ad6dd499e4ae07cb8b0a0fb58"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
