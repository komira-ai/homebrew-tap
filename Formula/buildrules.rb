class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.12/buildrules-cli-0.0.12-macos-arm64.tar.gz"
      sha256 "a5df6cb0c71c74d0f75ffee21f7e79b07af5aaa6aeeaf4fe83009748e6d0f370"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.12/buildrules-cli-0.0.12-linux-aarch64.tar.gz"
      sha256 "d962cd97dc488685278aedc9e2b615b97cd8cd5b97728c34715bbbf5d229aff9"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.12/buildrules-cli-0.0.12-linux-x86_64.tar.gz"
      sha256 "b7e28b5c7d0a76c820f566fdbaec73ad94822796c608f94f4cf7f1e3991354b5"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
