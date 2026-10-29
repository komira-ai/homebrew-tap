class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.95/mopm-0.0.95-macos-arm64.tar.gz"
      sha256 "4c7a0809ab0f7d55a623fe3dc1a217ae560567949301c42a5828dea470354063"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.95/mopm-0.0.95-linux-aarch64.tar.gz"
      sha256 "aaec3d15aec2799ee0e66547ff2d35bd5b7daf7fef607d651c6b66d6e8f79b80"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.95/mopm-0.0.95-linux-x86_64.tar.gz"
      sha256 "dc6685fd67de474964a613a5fc9e9cdfaa8f911c19f2c41400ebebfd593091da"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
