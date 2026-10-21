class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.17/buildrules-cli-0.0.17-macos-arm64.tar.gz"
      sha256 "dfcf006f3690a10d92fbd83bfdf44b3d6549f20530fdf754a8f8ee00aecd558d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.17/buildrules-cli-0.0.17-linux-aarch64.tar.gz"
      sha256 "4e5551491216c582998ae72562401004a0df59fbbc896d0a7b6b6c03d7f4678a"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.17/buildrules-cli-0.0.17-linux-x86_64.tar.gz"
      sha256 "78a2ad760e11b36e4e9f5fb05653c8814a0de2c9cab068eae8dbf4be339f1c80"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
