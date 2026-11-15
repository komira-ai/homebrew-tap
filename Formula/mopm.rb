class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.110/mopm-0.0.110-macos-arm64.tar.gz"
      sha256 "77e57cd4f13d4313430c55b39439d965349880a465eddb8930f81cedfda734b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.110/mopm-0.0.110-linux-aarch64.tar.gz"
      sha256 "f71140cda807994cfe6a77441e13bb45a7e5cfb813d72552798bbe85eba597d4"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.110/mopm-0.0.110-linux-x86_64.tar.gz"
      sha256 "27c719a418389d61a70c8982fdb59bd6420762ec1c1baae5955f8370b3df999c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
