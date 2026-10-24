class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.38/mopm-0.0.38-macos-arm64.tar.gz"
      sha256 "41fdd14a119dafc200163a742bb94a50f806752dead3d7f0dd0a1d7e69f28ad3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.38/mopm-0.0.38-linux-aarch64.tar.gz"
      sha256 "f47dfdb10fa7e8b756342246f01ecbf95621f30279d06a522fc98733f07d4314"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.38/mopm-0.0.38-linux-x86_64.tar.gz"
      sha256 "743f2e1dbae381fdbb61753c7dff595142b7f6092838d672c38759acaed85e8b"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
