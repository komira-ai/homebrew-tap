class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.19/buildrules-cli-0.0.19-macos-arm64.tar.gz"
      sha256 "ca8fe8f758b7a3f974837f64753a282b7d255fc6466c13e062cc97d37666aa91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.19/buildrules-cli-0.0.19-linux-aarch64.tar.gz"
      sha256 "ed24e74d908557c5ba8f361a65660a186827c86000baf8af93f33e8727a25f87"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.19/buildrules-cli-0.0.19-linux-x86_64.tar.gz"
      sha256 "94aec772f978d6297075c42a0833837780a8025bf1ef300a6739bc4830c23b3e"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
