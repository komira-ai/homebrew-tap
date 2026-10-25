class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.50/mopm-0.0.50-macos-arm64.tar.gz"
      sha256 "e4198727755a99917a22add2410e75ccd50d4b459b5f2e1e5e1ae3d440f1dc15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.50/mopm-0.0.50-linux-aarch64.tar.gz"
      sha256 "969955c508577e74e7ee7571e0a8c692f760f0f54e700d80cdc5c1a8175f4537"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.50/mopm-0.0.50-linux-x86_64.tar.gz"
      sha256 "91971525e530d6d433babe7613e0fd7fc42aa96f96a358bc0bf28be1830f5382"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
