class Accesslint < Formula
  desc "Static accessibility analysis for iOS/Swift apps"
  homepage "https://github.com/SyncTek-LLC/AccessLint"
  version "1.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/mauricecarrier7/AccessLint-Distribution/releases/download/v#{version}/accesslint-#{version}.artifactbundle.zip"
    sha256 "f1285a2a2d9fa6396d6d16711e41ac758eafe3d1ec02f25b31591668c6cfe7a9"
  end

  def install
    bundle_dir = "accesslint-#{version}-macos"
    if File.exist?("#{bundle_dir}/bin/accesslint")
      bin.install "#{bundle_dir}/bin/accesslint"
    elsif File.exist?("accesslint")
      bin.install "accesslint"
    else
      # Fallback: find the binary wherever it is in the extracted archive
      binary = Dir.glob("**/accesslint").find { |f| File.executable?(f) && !File.directory?(f) }
      bin.install binary if binary
    end
  end

  test do
    assert_match "AccessLint", shell_output("#{bin}/accesslint --version")
  end
end
