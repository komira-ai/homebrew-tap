class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.47/buildrules-cli-0.0.47-macos-arm64.tar.gz"
      sha256 "db1e7e64fb52d5e82340fc1ec01b7de3f7bea37a6e7a2b79c344bbb4f77762c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.47/buildrules-cli-0.0.47-linux-aarch64.tar.gz"
      sha256 "0b28fa5e598d6a47bf4c286c7fe6bc9050c3589b6d3a25252fd864afa4ae583a"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.47/buildrules-cli-0.0.47-linux-x86_64.tar.gz"
      sha256 "cf48aa7b7bda11ae42d0712de803c4a5386502b46d6aadce4a27096f2ac98d7b"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
