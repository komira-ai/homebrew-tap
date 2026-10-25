class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.58/mopm-0.0.58-macos-arm64.tar.gz"
      sha256 "90d5b2bb5ca7886740452d3648bc8f165230a076a6bb70fdbb12274324b7842b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.58/mopm-0.0.58-linux-aarch64.tar.gz"
      sha256 "b2c1853d264c94a064b0f41423fa191375ef2552e68a41e221811dd55d443ba7"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.58/mopm-0.0.58-linux-x86_64.tar.gz"
      sha256 "13a00f909d373525e5c8b0f66ddda68fe6080a66d661e9b7b3d1914c13ecc561"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
