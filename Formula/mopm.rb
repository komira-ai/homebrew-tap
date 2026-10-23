class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.31/mopm-0.0.31-macos-arm64.tar.gz"
      sha256 "4bf3116dc2fe14b05755c7c518e2be20f74fa965083cdbf3ba41e16e8186283d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.31/mopm-0.0.31-linux-aarch64.tar.gz"
      sha256 "29d004b2657714dd00c67a833b29047760ea6bd6aee5b233527cbd761cfb479b"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.31/mopm-0.0.31-linux-x86_64.tar.gz"
      sha256 "50d4f365bf67e2ebee15d98c5d701f28d502722341e0e98e8d39510ff75a13d8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
