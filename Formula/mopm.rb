class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.44/mopm-0.0.44-macos-arm64.tar.gz"
      sha256 "c4c9fa0816c640c54434094bb9ab4727e3c6deae92fea82115d0736802be7b5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.44/mopm-0.0.44-linux-aarch64.tar.gz"
      sha256 "35ba2ae7de3bafbb6411854b758d67b266639aff19bc192ad033f760fec2234f"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.44/mopm-0.0.44-linux-x86_64.tar.gz"
      sha256 "a97089567ab7ae1cb4ee18e031d8dc03560a836768e2aa015b6fc6027cdb1316"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
