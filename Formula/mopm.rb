class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.87/mopm-0.0.87-macos-arm64.tar.gz"
      sha256 "868daf4115218a08e4e186d2f83f2af188affb29abfd41485f430a1b8c308cab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.87/mopm-0.0.87-linux-aarch64.tar.gz"
      sha256 "7d0cb70ec74c93e447e181a5f5eb5a31b694647678fc251f884ef53284a9e59d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.87/mopm-0.0.87-linux-x86_64.tar.gz"
      sha256 "c2e87b231768598652d30514be480cf569f840e03827f9140e1f9af75c400234"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
